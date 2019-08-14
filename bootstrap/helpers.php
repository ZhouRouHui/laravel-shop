<?php

/**
 * 获取当前请求路由名
 *
 * @return mixed
 */
function route_class()
{
    return str_replace('.', '-', Route::currentRouteName());
}

/**
 * 开发环境获取内网穿透域名路由
 *
 * @param $routeName
 * @param array $parameters
 * @return string
 */
function ngrok_url($routeName, $parameters = [])
{
    // 开发环境，并且配置了 NGROK_URL
    if (app()->environment('local') && $url = config('app.ngrok_url')) {
        // route() 函数第三个参数代表是否绝对路径
        return $url . route($routeName, $parameters, false);
    }

    return route($routeName, $parameters);
}

/**
 * 公用的实例化 BigNumber 的方法封装
 *
 * @param $number
 * @param int $scale
 * @return \Moontoast\Math\BigNumber
 */
function big_number($number, $scale = 2)
{
    return new \Moontoast\Math\BigNumber($number, $scale);
}
