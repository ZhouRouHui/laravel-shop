<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::redirect('/', '/products')->name('root');
//Route::get('products', 'ProductsController@notEsIndex')->name('products.not_es_index');
Route::get('products', 'ProductsController@esIndex')->name('products.index');

// 加上 verify == true 的参数，系统会自动实现邮箱验证功能
Auth::routes(['verify' => true]);

// auth 中间件代表需要登录，verified中间件代表需要经过邮箱验证
Route::group(['middleware' => ['auth', 'verified']], function() {
    // 用户地址
    Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');
    Route::get('user_addresses/create', 'UserAddressesController@create')->name('user_addresses.create');
    Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');
    Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit');
    Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');
    Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');

    // 商品
    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');
    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');
    Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');

    // 购物车
    Route::post('cart', 'CartController@add')->name('cart.add');
    Route::get('cart', 'CartController@index')->name('cart.index');
    Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');

    // 订单
    Route::post('orders', 'OrdersController@store')->name('orders.store');
    Route::get('orders', 'OrdersController@index')->name('orders.index');
    Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');
    Route::post('orders/{order}/received', 'OrdersController@received')->name('orders.received');
    Route::get('orders/{order}/review', 'OrdersController@review')->name('orders.review.show');
    Route::post('orders/{order}/review', 'OrdersController@sendReview')->name('orders.review.store');
    Route::post('orders/{order}/apply_refund', 'OrdersController@applyRefund')->name('orders.apply_refund');
    Route::post('crowdfunding_orders', 'OrdersController@crowdfunding')->name('crowdfunding_orders.store');

    // 支付
    Route::get('payment/{order}/alipay', 'PaymentController@payByAlipay')->name('payment.alipay');
    Route::get('payment/alipay/return', 'PaymentController@alipayReturn')->name('payment.alipay.return');
    Route::get('payment/{order}/wechat', 'PaymentController@payByWechat')->name('payment.wechat');
    Route::post('payment/{order}/installment', 'PaymentController@payByInstallment')->name('payment.installment');  // 分期付款

    // 分期付款支付
    Route::get('installments/{installment}/alipay', 'InstallmentsController@payByAlipay')->name('installments.alipay');
    Route::get('installments/alipay/return', 'InstallmentsController@alipayReturn')->name('installments.alipay.return');
    Route::get('installments/{installment}/wechat', 'InstallmentsController@payByWechat')->name('installments.wechat');

    // 优惠券
    Route::get('coupon_codes/{code}', 'CouponCodesController@show')->name('coupon_codes.show');

    // 分期付款列表
    Route::get('installments', 'InstallmentsController@index')->name('installments.index');
    Route::get('installments/{installment}', 'InstallmentsController@show')->name('installments.show');

});

// ----- 服务器端支付回调 start，回调接口为支付平台调用接口，不可放入有中间件的路由组中 -----
Route::post('payment/alipay/notify', 'PaymentController@alipayNotify')->name('payment.alipay.notify');
Route::post('payment/wechat/notify', 'PaymentController@wechatNotify')->name('payment.wechat.notify');
Route::post('payment/wechat/refund_notify', 'PaymentController@wechatRefundNotify')->name('payment.wechat.refund_notify');

// 分期付款回调
Route::post('installments/alipay/notify', 'InstallmentsController@alipayNotify')->name('installments.alipay.notify');
Route::post('installments/wechat/notify', 'InstallmentsController@wechatNotify')->name('installments.wechat.notify');
Route::post('installments/wechat/refund_notify', 'InstallmentsController@wechatRefundNotify')->name('installments.wechat.refund_notify');
// ----- 服务器段支付回调 end   -----

Route::get('products/{product}', 'ProductsController@show')->name('products.show');
