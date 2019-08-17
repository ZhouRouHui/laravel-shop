<?php

namespace App\Http\Controllers;

use App\Models\Installment;
use Illuminate\Http\Request;

class InstallmentsController extends Controller
{
    /**
     * 分期付款列表
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $installments = Installment::query()->whereUserId($request->user()->id)->paginate(10);

        return view('installments.index', ['installments' => $installments]);
    }
}
