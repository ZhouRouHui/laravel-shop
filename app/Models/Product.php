<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Product extends Model
{
    // 商品性质类型
    const TYPE_NORMAL = 'normal';
    const TYPE_CROWDFUNDING = 'crowdfunding';

    protected static $typeMap = [
        self::TYPE_NORMAL => '普通商品',
        self::TYPE_CROWDFUNDING => '众筹商品'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'description', 'image', 'on_sale',
        'rating', 'sold_count', 'review_count', 'price',
        'type'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'on_sale' => 'boolean', // on_sale 是一个布尔类型的字段
    ];

    /**
     * 与商品SKU关联
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }

    public function getImageUrlAttribute()
    {
        // 如果 image 字段本身就已经是完整的 url 就直接返回
        if (Str::startsWith($this->attributes['image'], ['http://', 'https://'])) {
            return $this->attributes['image'];
        }
        // 这里的 public 的参数需要和我们在 config/admin.php 的 upload.disk 配置一致
        return \Storage::disk('public')->url($this->attributes['image']);
    }

    /**
     * 关联类目
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * 关联众筹商品模型
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function crowdfunding()
    {
        return $this->hasOne(CrowdfundingProduct::class);
    }
}
