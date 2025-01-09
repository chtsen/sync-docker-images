#!/bin/bash

while read line
do
  image=$(echo $line |awk -F"/" '{print $NF}')
  # skopeo copy --all docker://docker.io/$line docker://docker.io/chtsen/$line
  # skopeo copy --all docker://docker.io/$line docker://registry.cn-hangzhou.aliyuncs.com/chtsen-sysnc/$image
  skopeo copy --all docker://docker.io/$line docker://chtsen/yozo-tomcat:9.0.98-uuid/chtsen-sysnc/$image
  # skopeo copy --all docker://docker.io/$line docker://hub.yozosoft.com:4431/hub-sysnc/$image
done < ./docker-images.txt
