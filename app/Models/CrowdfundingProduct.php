<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// 众筹商品模型
class CrowdfundingProduct extends Model
{
    // 定义众筹的 3 中状态
    const STATUS_FUNDING = 'funding';
    const STATUS_SUCCESS = 'success';
    const STATUS_FAIL = 'fail';

    public static $statusMap = [
        self::STATUS_FUNDING => '众筹中',
        self::STATUS_SUCCESS => '众筹成功',
        self::STATUS_FAIL => '众筹失败',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['total_amount', 'target_amount', 'user_count', 'status', 'end_at'];

    /**
     * @var array
     */
    protected $dates = ['end_at'];

    /**
     * @var bool
     */
    public $timestamps = false;

    /**
     * 关联商品
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * 定义一个名为 percent 的访问器，返回当前众筹进度
     *
     * @return float
     */
    public function getPercentAttribute()
    {
        // 已筹金额除以目标金额
        $value = $this->attributes['total_amount'] / $this->attributes['target_amount'];

        return floatval(number_format($value * 100, 2, '.', ''));
    }
}
