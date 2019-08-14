<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Request;

class InvalidRequestException extends Exception
{
    /**
     * InvalidRequestException constructor.
     * @param string $message
     * @param int $code
     */
    public function __construct(string $message = '', int $code = 400)
    {
        parent::__construct($message, $code);
    }

    /**
     * 异常执行
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function render(Request $request)
    {
        if ($request->expectsJson()) {
            // json() 防范第二个参数是 Http 返回码
            return response()->json(['msg' => $this->message, $this->code]);
        }

        return view('pages.error', ['msg' => $this->message]);
    }
}
