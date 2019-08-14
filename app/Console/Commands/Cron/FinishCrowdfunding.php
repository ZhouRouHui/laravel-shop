<?php

namespace App\Console\Commands\Cron;

use Carbon\Carbon;
use Illuminate\Console\Command;
use App\Models\CrowdfundingProduct;
use App\Jobs\RefundCrowdfundingOrders;

class FinishCrowdfunding extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:finish-crowdfunding';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '结束众筹';

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
        // 获取所有已到期且状态还为众筹中的众筹产品
        // 遍历每个众筹产品
        // 判断众筹结果
        // 成功，将众筹状态改为成功
        // 失败，获取产品对应的订单，对每个符合条件的订单执行退款动作
        CrowdfundingProduct::query()
            ->where('end_at', '<=', Carbon::now())
            ->where('status', CrowdfundingProduct::STATUS_FUNDING)
            ->get()
            ->each(function (CrowdfundingProduct $crowdfunding) {
                if ($crowdfunding->target_amount > $crowdfunding->total_amount) {
                    // 失败
                    $this->crowdfundingFailed($crowdfunding);
                } else {
                    // 成功
                    $this->crowdfundingSuccess($crowdfunding);
                }
            });
    }

    /**
     * 众筹成功
     *
     * @param CrowdfundingProduct $crowdfunding
     */
    protected function crowdfundingSuccess(CrowdfundingProduct $crowdfunding)
    {
        // 状态置为成功
        $crowdfunding->update(['status' => CrowdfundingProduct::STATUS_SUCCESS]);
    }

    /**
     * 众筹失败
     *
     * @param CrowdfundingProduct $crowdfunding
     */
    protected function crowdfundingFailed(CrowdfundingProduct $crowdfunding)
    {
        // 状态置为失败
        $crowdfunding->update(['status' => CrowdfundingProduct::STATUS_FAIL]);

        dispatch(new RefundCrowdfundingOrders($crowdfunding));
    }
}
