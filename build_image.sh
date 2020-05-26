#!/bin/bash
###
 # @Author: shangyameng
 # @Email: shangyameng@aliyun.com
 # @Date: 2020-04-22 22:25:29
 # @LastEditTime: 2020-04-23 10:44:43
 # @FilePath: /aria2/build_image.sh
 ###

echo "开始构建镜像"
docker build -t aria:latest . | awk '{print $0}'

echo "构建完成，请启动"


