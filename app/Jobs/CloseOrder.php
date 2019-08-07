<?php

namespace App\Jobs;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

// 代表这个类需要被放到队列中执行，而不是触发时立即执行
class CloseOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * 订单模型
     * @var Order $order
     */
    protected $order;

    /**
     * Create a new job instance.
     *
     * CloseOrder constructor.
     * @param Order $order
     * @param $delay
     */
    public function __construct(Order $order, $delay)
    {
        $this->order = $order;
        // 设置延迟的时间，delay() 方法的参数代表多少秒后执行
        $this->delay($delay);
    }

    /**
     * Execute the job.
     * job 的具体逻辑执行
     *
     * @return void
     */
    public function handle()
    {
        // 判断对应的订单是否已经被支付
        // 如果已经支付则不需要关闭订单，直接推出
        if ($this->order->paid_at) {
            return;
        }

        // 通过事务执行 sql
        \DB::transaction(function() {
            // 将订单的 closed 字段标记为 true， 即关闭订单
            $this->order->update(['closed' => true]);
            // 循环遍历订单中的 sku，将订单中的数量加回到 sku 的库存中去
            foreach ($this->order->items as $item) {
                $item->productSku->addStock($item->amount);
            }
            if ($this->order->couponCode) {
                $this->order->couponCode->changeUsed(false);
            }
        });
    }
}
