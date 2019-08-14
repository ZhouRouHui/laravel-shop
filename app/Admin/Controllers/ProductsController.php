<?php

namespace App\Admin\Controllers;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use App\Models\Product;

class ProductsController extends CommonProductsController
{
    /**
     * 获取商品类型
     *
     * @return string
     */
    public function getProductType()
    {
        return Product::TYPE_NORMAL;
    }

    /**
     * 设置表格要展示的字段
     *
     * @param Grid $grid
     */
    protected function customGrid(Grid $grid)
    {
        $grid->model()->with(['category']);
        $grid->id('ID')->sortable();
        $grid->title('商品名称');
        $grid->column('category.name', '类目');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->price('价格');
        $grid->rating('评分');
        $grid->sold_count('销量');
        $grid->review_count('评论数');
    }

    /**
     * 设置额外表单字段
     * @param Form $form
     */
    protected function customForm(Form $form)
    {
        // 普通商品没有额外的字段，因此这里不需要写任何代码
    }
}
