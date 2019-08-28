#!/bin/bash

# elasticsearch 使用相关命令

# 启动 es 服务
sudo systemctl restart elasticsearch.service

# 测试 es 启动是否成功，es 启动需要时间，大概 10s ～ 1min
curl 127.0.0.1:9200

# 停止 es 服务
sudo systemctl stop elasticsearch.service

# 关闭 es 开机启动
sudo systemctl disable elasticsearch.service

# 开启索引，接口地址 /{index_name}/_open
curl -XPOST http://localhost:9200/products/_open?pretty

# 关闭索引，接口地址 /{index_name}/_close
curl -XPOST http://localhost:9200/products/_close?pretty

# 查看 index 中一个 type 有多少个文档，接口地址 /{index_name}/{type_name}/_count
curl http://localhost:9200/products/_doc/_count?pretty

# 创建一个 index，接口地址 /{index_name}
curl -XPUT http://localhost:9200/test_index

# 查看一个索引的详情，接口地址 /{index_name}
curl http://localhost:9200/test_index
curl http://localhost:9200/test_index?pretty  # 格式化 json 信息展示结果

# 在 index 中创建 type，接口地址 /{index_name}/_mapping/{type_name}
curl -H'Content-Type: application/json' -XPUT http://localhost:9200/test_index/_mapping/_doc?pretty -d'{
  "properties": {
    "title": { "type": "text", "analyzer": "ik_smart" },
    "description": { "type": "text", "analyzer": "ik_smart" },
    "price": { "type": "scaled_float", "scaling_factor": 100 }
  }
}'

# 往 index 里面插入文档，接口地址 /{index_name}/{type_name}/{id}
# es 与 mysql 的不同点，id 不是自增，而是需要自己指定
curl -H'Content-Type: application/json' -XPUT http://localhost:9200/test_index/_doc/1?pretty -d'{
    "title": "iPhone X",
    "description": "新品到货",
    "price": 8848
}'

# 读取文档数据，接口地址 /{index_name}/{type_name}/{id}
curl http://localhost:9200/test_index/_doc/1?pretty

# 搜索，接口地址 /{index_name}/{type_name}/_search
curl -XPOST -H'Content-Type:application/json' http://localhost:9200/test_index/_doc/_search?pretty -d'
{
    "query" : { "match" : { "description" : "新品" }}
}'


# PHP elasticsearch/elasticsearch 使用
# app('es')->get(['index' => 'test_index','type' => '_doc', 'id' => 1]) 获取某一个商品属性
# app('es')->index(['id' => $arr['id'], 'index' => 'products', 'type' => '_doc', 'body' => $arr]);  将商品属性写入 es
# app('es')->search($params); 进行查询

# 词项查询
#$params = [
#    'index' => 'products',
#    'type'  => '_doc',
#    'body'  => [
#        'query' => [
#            'bool' => [
#                'filter' => [
#                    ['term' => ['on_sale' => true]],
#                ],
#            ],
#        ],
#    ],
#];
#app('es')->search($params);

# 分页查询
#$params = [
#    'index' => 'products',
#    'type'  => '_doc',
#    'body'  => [
#        'from'  => 0,
#        'size'  => 5,
#        'query' => [
#            'bool' => [
#                'filter' => [
#                    ['term' => ['on_sale' => true]],
#                ],
#            ],
#        ],
#    ],
#];
#$results = app('es')->search($params);
#count($results['hits']['hits']);
#$results['hits']['total']

# 排序
#$params = [
#    'index' => 'products',
#    'type'  => '_doc',
#    'body'  => [
#        'from'  => 0,
#        'size'  => 5,
#        'query' => [
#            'bool' => [
#                'filter' => [
#                    ['term' => ['on_sale' => true]],
#                ],
#            ],
#        ],
#        'sort' => [
#            ['price' => 'desc']
#        ],
#    ],
#];
#$results = app('es')->search($params);
#collect($results['hits']['hits'])->pluck('_source.price');

# 多字段匹配查询
#$params = [
#    'index' => 'products',
#    'type'  => '_doc',
#    'body'  => [
#        'query' => [
#            'bool' => [
#                'filter' => [
#                    ['term' => ['on_sale' => true]],
#                ],
#                'must' => [
#                    [
#                        'multi_match' => [
#                            'query'  => 'iPhone',
#                            'fields' => [
#                                'title^3',
#                                'long_title^2',
#                                'description',
#                            ],
#                        ],
#                    ],
#                ],
#            ],
#        ],
#    ],
#];
#app('es')->search($params);

# 多字段匹配查询支持 Nested（嵌套） 对象
#$params = [
#    'index' => 'products',
#    'type'  => '_doc',
#    'body'  => [
#        'query' => [
#            'bool' => [
#                'filter' => [
#                    ['term' => ['on_sale' => true]],
#                ],
#                'must' => [
#                    [
#                        'multi_match' => [
#                            'query'  => '256G',
#                            'fields' => [
#                                'skus.title',
#                                'skus.description',
#                                'properties.value',
#                            ],
#                        ],
#                    ],
#                ],
#            ],
#        ],
#    ],
#];
#app('es')->search($params);
