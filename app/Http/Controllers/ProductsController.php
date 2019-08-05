<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index(Request $request)
    {
        /**
         * 这里详细解释一下模糊搜索那段代码，我们这里的实现是先用 $builder->where() 传入一个匿名函数，
         * 然后才在这个匿名函数里面再去添加 like 搜索，这样做目的是在查询条件的两边加上 ()，也就是说最终执行的 SQL 语句类似
         * select * from products where on_sale = 1 and ( title like xxx or description like xxx )，
         * 试想如果我们直接用下面的代码：
         * $like = '%'.$search.'%';
         * $builder->where('title', 'like', $like)
         *      ->orWhere('description', 'like', $like)
         *      ->orWhereHas('skus', function ($query) use ($like) {
         *          $query->where('title', 'like', $like)
         *              ->orWhere('description', 'like', $like);
         *      });
         * 那么生成的 SQL 就会变成 select * from products where on_sale = 1 and title like xxx or description like xxx，
         * 这个 SQL 会把 on_sale = 0 但 description 包含搜索词的商品也搜索出来，这不符合我们的期望。
         */
        // 创建一个查询构造器
        $builder = Product::query()->where('on_sale', true);
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量
        // search 参数用来模糊搜索商品
        if ($search = $request->input('search', '')) {
            $like = '%'.$search.'%';
            // 模糊搜索商品标题、商品详情、SKU 标题、SKU描述
            $builder->where(function ($query) use ($like) {
                $query->where('title', 'like', $like)
                    ->orWhere('description', 'like', $like)
                    ->orWhereHas('skus', function ($query) use ($like) {
                        $query->where('title', 'like', $like)
                            ->orWhere('description', 'like', $like);
                    });
            });
        }

        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        if ($order = $request->input('order', '')) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }

        $products = $builder->paginate(16);
        return view('products.index', [
            'products' => $products,
            'filters' => [
                'search' => $search,
                'order' => $order
            ]
        ]);
    }
}
