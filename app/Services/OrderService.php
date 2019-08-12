<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserAddress;
use App\Models\Order;
use App\Models\ProductSku;
use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;
use Carbon\Carbon;
use App\Models\CouponCode;
use App\Exceptions\CouponCodeUnavailableException;

/**
 * 订单服务类
 *
 * Class OrderService
 * @package App\Services
 */
class OrderService
{
    /**
     * 普通商品创建订单
     *
     * @param User $user
     * @param UserAddress $address
     * @param $remark
     * @param $items
     * @param CouponCode|null $coupon
     * @return mixed
     * @throws CouponCodeUnavailableException
     */
    public function store(User $user, UserAddress $address, $remark, $items, CouponCode $coupon = null)
    {
        /**
         * $user、$address 变量改为从参数获取。我们在封装功能的时候有一点一定要注意，
         * $request 不可以出现在控制器和中间件以外的地方，根据职责单一原则，
         * 获取数据这个任务应该由控制器来完成，封装的类只需要专注于业务逻辑的实现。
         */
        /**
         *  1、DB::transaction() 方法会开启一个数据库事务，在回调函数里的所有 SQL 写操作都会被包含在这个事务里，
         *     如果回调函数抛出异常则会自动回滚这个事务，否则提交事务。用这个方法可以帮我们节省不少代码。
         *  2、在事务里先创建了一个订单，把当前用户设为订单的用户，然后把传入的地址数据快照进 address 字段。
         *     然后遍历传入的商品 SKU 及其数量，$order->items()->make() 方法可以新建一个关联关系的对象（也就是 OrderItem）但不保存到数据库，
         *     这个方法等同于 $item = new OrderItem(); $item->order()->associate($order);
         *  3、然后根据所有的商品单价和数量求得订单的总价格，更新到刚刚创建的订单的 total_amount 字段。
         *  4、最后使用 Laravel 提供的 collect() 辅助函数快速取得所有 SKU ID，然后将本次订单中的商品 SKU 从购物车中删除
         */
        // 如果传入了优惠券，则先检查是否可用
        if ($coupon) {
            // 但此时我们还没有计算出订单总金额，因此先不校验
            $coupon->checkAvailable($user);
        }

        // 开启一个数据库事务
        $order = \DB::transaction(function () use ($user, $address, $remark, $items, $coupon) {
            // 更新此地址的最后使用时间
            $address->update(['last_used_at' => Carbon::now()]);
            // 创建一个订单
            $order   = new Order([
                'address'      => [ // 将地址信息放入订单中
                    'address'       => $address->full_address,
                    'zip'           => $address->zip,
                    'contact_name'  => $address->contact_name,
                    'contact_phone' => $address->contact_phone,
                ],
                'remark'       => $remark,
                'total_amount' => 0,
            ]);
            // 订单关联到当前用户
            $order->user()->associate($user);
            // 写入数据库
            $order->save();

            $totalAmount = 0;
            // 遍历用户提交的 SKU
            foreach ($items as $data) {
                $sku  = ProductSku::find($data['sku_id']);
                // 创建一个 OrderItem 并直接与当前订单关联
                $item = $order->items()->make([
                    'amount' => $data['amount'],
                    'price'  => $sku->price,
                ]);
                $item->product()->associate($sku->product_id);
                $item->productSku()->associate($sku);
                $item->save();
                $totalAmount += $sku->price * $data['amount'];
                if ($sku->decreaseStock($data['amount']) <= 0) {
                    throw new InvalidRequestException('该商品库存不足');
                }
            }
            if ($coupon) {
                // 总金额已经计算出来了，检查是否符合优惠券规则
                $coupon->checkAvailable($user, $totalAmount);
                // 把订单金额修改为优惠后的金额
                $totalAmount = $coupon->getAdjustedPrice($totalAmount);
                // 将订单与优惠券关联
                $order->couponCode()->associate($coupon);
                // 增加优惠券的用量，需判断返回值
                if ($coupon->changeUsed() <= 0) {
                    throw new CouponCodeUnavailableException('该优惠券已被兑完');
                }
            }
            // 更新订单总金额
            $order->update(['total_amount' => $totalAmount]);

            // 将下单的商品从购物车中移除
            $skuIds = collect($items)->pluck('sku_id')->all();
            // CartService 的调用方式改为了通过 app() 函数创建，因为这个 store() 方法是我们手动调用的，
            // 无法通过 Laravel 容器的自动解析来注入。在我们代码里调用封装的库时一定 不可以 使用 new 关键字来初始化，
            // 而是应该通过 Laravel 的容器来初始化，因为在之后的开发过程中 CartService 类的构造函数可能会发生变化，
            // 比如注入了其他的类，如果我们使用 new 来初始化的话，就需要在每个调用此类的地方进行修改；
            // 而使用 app() 或者自动解析注入等方式 Laravel 则会自动帮我们处理掉这些依赖。
            app(CartService::class)->remove($skuIds);

            return $order;
        });

        // 这里我们直接使用 dispatch 函数
        dispatch(new CloseOrder($order, config('app.order_ttl')));

        return $order;
    }

    public function crowdfunding(User $user, UserAddress $address, ProductSku $sku, $amount)
    {
        // 开启事务
        $order = \DB::transaction(function () use ($amount, $sku, $user, $address) {
            // 更新地址最后使用时间
            $address->update(['last_used_at' => Carbon::now()]);
            // 创建一个订单
            $order = new Order([
               'address'        => [
                   'address'        => $address->full_address,
                   'zip'            => $address->zip,
                   'contact_name'   => $address->contact_name,
                   'contact_phone'  => $address->contact_phone
               ],
                'remark'        => '',
                'total_amount'  => $sku->price * $amount,
            ]);
            // 订单关联到用户
            $order->user()->associate($user);
            // 写入数据库
            $order->save();
            // 创建一个新的订单项并与 sku 关联
            $item = $order->items()->make([
                'amount' => $amount,
                'price'  => $sku->price,
            ]);
            $item->product()->associate($sku->product_id);
            $item->productSku()->associate($sku);
            $item->save();
            // 扣减对应 sku 库存
            if ($sku->decreaseStock($amount) <= 0) {
                throw new InvalidRequestException('该商品库存不足');
            }

            return $order;
        });

        // 众筹结束时间减去当前时间得到剩余秒数
        $crowdfundingTtl = $sku->product->crowdfunding->end_at->getTimestamp() - time();
        // 剩余秒数与默认订单关闭时间取较小值作为订单关闭时间
        dispatch(new CloseOrder($order, min(config('app.order_ttl'), $crowdfundingTtl)));

        return $order;
    }
}
