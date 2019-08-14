<?php

namespace App\Http\Controllers;

use App\Models\ProductSku;
use Illuminate\Http\Request;
use App\Services\CartService;
use App\Http\Requests\AddCartRequest;

class CartController extends Controller
{
    /**
     * 购物车服务
     * @var CartService $cartService
     */
    protected $cartService;

    // 利用 laravel 的自动解析功能注入 CartService 类
    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    /**
     * 购物车列表
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $cartItems = $this->cartService->get();
        $addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();

        return view('cart.index', ['cartItems' => $cartItems, 'addresses' => $addresses]);
    }

    /**
     * 添加购物车
     *
     * @param AddCartRequest $request
     * @return array
     */
    public function add(AddCartRequest $request)
    {
        $this->cartService->add($request->input('sku_id'), $request->input('amount'));

        return [];
    }

    /**
     * 删除购物车商品
     * @param ProductSku $sku
     * @return array
     */
    public function remove(ProductSku $sku)
    {
        $this->cartService->remove($sku->id);
        return [];
    }
}
