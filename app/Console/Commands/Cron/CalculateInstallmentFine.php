<?php

namespace App\Console\Commands\Cron;

use App\Models\Installment;
use App\Models\InstallmentItem;
use Carbon\Carbon;
use Illuminate\Console\Command;

class CalculateInstallmentFine extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:calculate-installment-fine';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '计算分期付款的逾期费';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        InstallmentItem::query()
            // 预加载分期付款数据，避免 N + 1 问题
            ->with(['installment'])
            ->whereHas('installment', function ($query) {
                // 对应的分期状态为还款中
                $query->where('status', Installment::STATUS_REPAYING);
            })
            // 还款截止日期在当前时间之前
            ->where('due_date', '<=', Carbon::now())
            // 尚未还款
            ->whereNull('paid_at')
            // 使用 chunkById 避免一次性查询太多记录
            ->chunkById(1000, function ($items) {
                // 遍历查询出来的还款计划
                foreach ($items as $item) {
                    // 通过 Carbon 对象的 diffInDays 直接得到逾期天数
                    $overdueDays = Carbon::now()->diffInDays($item->due_date);
                    // 本金与手续费之和
                    $base = big_number($item->base)->add($item->fee)->getValue();
                    // 计算逾期费，先乘以逾期天数，再乘以逾期费率，这个顺序是有讲究的，不能轻易调换
                    // >>> big_number(10)->multiply(0.0001)->multiply(10000)->getValue()  // 0.00
                    // >>> big_number(10)->multiply(10000)->multiply(0.0001)->getValue()  // 10.00
                    // 可以看到结果截然不同，这是因为第一行在执行第一次乘法时，得到的结果是 0.001，但我们只保留小数点后两位，
                    // 所以会移除掉小数两位以后的数字，最终结果是 0，对 0 乘以 10000 结果还是 0。
                    // 因此我们在做这种高精度的计算时，应优先执行让结果绝对值变大的数（即先乘绝对值大的数或先除绝对值小的数）。
                    $fine = big_number($base)
                        ->multiply($overdueDays)
                        ->multiply($item->installment->fine_rate)
                        ->divide(100)
                        ->getValue();
                    // 避免逾期费高于本金与手续费之和，使用 compareTo 方法来判断
                    // 如果 $fine 大于 $base，则 compareTo 会返回 1，相等返回 0，小于返回 -1
                    $fine = big_number($fine)->compareTo($base) === 1 ? $base : $fine;
                    $item->update([
                        'fine' => $fine,
                    ]);
                }
            });
    }
}
