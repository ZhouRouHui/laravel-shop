<?php

namespace App\Http\Requests;

use App\Models\ProductSku;

class AddCartRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        /**
         * 校验 sku_id 的第二个规则是一个闭包校验规则，这个闭包接受 3 个参数，分别是参数名、参数值和错误回调。
         * 在这个闭包里我们依次判断了用户提交的 SKU ID 是否存在、商品是否上架以及库存是否充足。
         * 闭包校验规则允许我们直接通过匿名函数的方式来校验用户输入，比较适合在项目中只使用一次的情况。
         * 闭包校验规则在 Laravel 5.5 开始支持，但在 5.6 的文档才有介绍。
         */
        return [
            'sku_id' => [
                'required', function ($attribute, $value, $fail) {
                    if (!$sku = ProductSku::find($value)) {
                        return $fail('该商品不存在');
                    }
                    if (!$sku->product->on_sale) {
                        return $fail('该商品未上架');
                    }
                    if ($sku->stock === 0) {
                        return $fail('该商品已售完');
                    }
                    if ($this->input('amount') > 0 && $sku->stock < $this->input('amount')) {
                        return $fail('该商品库存不足');
                    }
                }
            ],
            'amount' => ['required', 'integer', 'min:1'],
        ];
    }

    /**
     * Get custom attributes for validator errors.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            'amount' => '商品数量'
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'sku_id.required' => '请选择商品'
        ];
    }
}
