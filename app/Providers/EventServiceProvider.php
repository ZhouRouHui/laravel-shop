<?php

namespace App\Providers;

use App\Events\OrderPaid;
use App\Events\OrderReviewed;
use App\Listeners\SendOrderPaidMail;
use Illuminate\Support\Facades\Event;
use App\Listeners\UpdateProductRating;
use Illuminate\Auth\Events\Registered;
use App\Listeners\UpdateProductSoldCount;
use App\Listeners\UpdateCrowdfundingProductProgress;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        // 注册事件监听，5.8 框架自带
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        // 订单支付事件监听
        OrderPaid::class => [
            UpdateProductSoldCount::class,
            SendOrderPaidMail::class,
            UpdateCrowdfundingProductProgress::class,
        ],
        // 订单评价事件监听
        OrderReviewed::class => [
            UpdateProductRating::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
