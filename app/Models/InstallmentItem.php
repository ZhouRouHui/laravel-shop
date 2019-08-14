<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class InstallmentItem extends Model
{
    /**
     * 退款进度
     */
    const REFUND_STATUS_PENDING = 'pending';
    const REFUND_STATUS_PROCESSING = 'processing';
    const REFUND_STATUS_SUCCESS = 'success';
    const REFUND_STATUS_FAILED = 'failed';

    /**
     * 退款进度映射
     *
     * @var array
     */
    public static $refundStatusMap = [
        self::REFUND_STATUS_PENDING    => '未退款',
        self::REFUND_STATUS_PROCESSING => '退款中',
        self::REFUND_STATUS_SUCCESS    => '退款成功',
        self::REFUND_STATUS_FAILED     => '退款失败',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'sequence',
        'base',
        'fee',
        'fine',
        'due_date',
        'paid_at',
        'payment_method',
        'payment_no',
        'refund_status',
    ];

    /**
     * 事件格式
     *
     * @var array
     */
    protected $dates = ['due_date', 'paid_at'];

    /**
     * 反向关联分期
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function installment()
    {
        return $this->belongsTo(Installment::class);
    }

    /**
     * 创建一个访问器，返回当前还款计划需还款的总金额
     *
     * @return string
     */
    public function getTotalAttribute()
    {
        // 小数点计算需要用 bcmath 扩展提供的函数
        // $total = bcadd($this->base, $this->fee, 2);
        // 使用 moontoast/math 代替官方的 bcmath 扩展，该包底层也是依赖 bcmath，主要是做了面向对的封装
        $total = big_number($this->base)->add($this->fee);
        if (!is_null($this->fine)) {
            // $total = bcadd($total, $this->fine, 2);
            $total->add($this->fine);
        }

        return $total->getValue();
    }

    /**
     * 创建一个访问器，返回当前还款计划是否已经逾期
     *
     * @return bool
     */
    public function getIsOverdueAttribute()
    {
        return Carbon::now()->gt($this->due_date);
    }
}
