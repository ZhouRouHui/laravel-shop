<?php

namespace App\Jobs;

use App\Models\Order;
use App\Services\OrderService;
use Illuminate\Bus\Queueable;
use App\Models\CrowdfundingProduct;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

// 代表这个类需要被放到队列中执行，而不是触发时立即执行
class RefundCrowdfundingOrders implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * 众筹商品
     *
     * @var CrowdfundingProduct $crowdfunding
     */
    protected $crowdfunding;

    /**
     * Create a new job instance.
     *
     * @var CrowdfundingProduct $crowdfunding
     * @return void
     */
    public function __construct(CrowdfundingProduct $crowdfunding)
    {
        $this->crowdfunding = $crowdfunding;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // 如果众筹的状态不是失败则不执行退款，原则上不会发生，这里只是增加健壮性
        if ($this->crowdfunding->status != CrowdfundingProduct::STATUS_FAIL) {
            return;
        }
        $orderService = app(OrderService::class);
        // 获取商品订单并退款
        Order::query()
            ->where('type', Order::TYPE_CROWDFUNDING)
            ->whereNotNull('paid_at')
            ->whereHas('items', function ($query) use ($crowdfunding) {
                $query->where('product_id', $crowdfunding->product_id);
            })
            ->get()
            ->each(function (Order $order) use ($orderService) {
                // 退款
                $orderService->refundOrder($order);
            });
    }
}
