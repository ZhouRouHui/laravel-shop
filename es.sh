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
