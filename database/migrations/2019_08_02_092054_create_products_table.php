<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->text('description');
            $table->string('image');
            $table->boolean('on_sale')->default(true);
            $table->float('rating')->default(5);
            $table->unsignedInteger('sold_count')->default(0);
            $table->unsignedInteger('review_count')->default(0);
            // 电商项目中与钱相关的有小数点的字段一律使用 decimal 类型，而不是 float 和 double，
            // 后面两种类型在做小数运算时有可能出现精度丢失的问题，这在电商系统里是绝对不允许出现的。
            // 定义 decimal 字段时需要两个参数，一个是数值总的精度（整数位 + 小数位），另一个参数则是小数位。
            // 对于我们这个系统来说总精度 10、小数位精度 2 即可满足需求（约 1 亿）
            $table->decimal('price', 10, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
