<?php

namespace App\Listeners;

use App\Events\OrderPaid;
use App\Models\Order;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\DB;

class UpdateCrowdfundingProductProgress implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  OrderPaid  $event
     * @return void
     */
    public function handle(OrderPaid $event)
    {
        $order = $event->getOrder();
        // 如果不是众筹订单则什么也不需要做
        if ($order->type === Order::TYPE_NORMAL) {
            return;
        }
        $crowdfunding = $order->items[0]->product->crowdfunding;

        // Laravel 在构建 SQL 的时候如果遇到 DB::raw() 就会把 DB::raw() 的参数原样拼接到 SQL 里。
        $data = Order::query()
            // 查找订单类型为众筹订单
            ->where('type', Order::TYPE_CROWDFUNDING)
            // 并且是已支付
            ->whereNotNull('paid_at')
            ->whereHas('items', function ($query) use ($crowdfunding) {
                // 并且是包含了本商品
                $query->where('product_id', $crowdfunding->product_id);
            })->first([
                // 取出订单总金额
                DB::raw('sum(total_amount) as total_amount'),
                // 取出去重的支持用户数
                DB::raw('count(distinct(user_id)) as user_count'),
            ]);

        $crowdfunding->update([
            'total_amount' => $data->total_amount,
            'user_count'   => $data->user_count,
        ]);
    }
}
