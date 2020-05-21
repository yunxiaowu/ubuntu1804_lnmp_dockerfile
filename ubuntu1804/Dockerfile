FROM ubuntu:18.04
MAINTAINER yuanzhen <575173869@qq.com>

# 更换镜像源为国内源
COPY ./sources.list /etc/apt/sources.list

# 安装基础工具
RUN apt-get -y update && apt-get -y upgrade \
    && apt-get install -y software-properties-common \
    && apt-get install -y vim wget \
    && apt-get install -y unzip \
    && apt-get install -y curl

# 添加PPA源并配置中科大反代
RUN add-apt-repository ppa:ondrej/nginx \
    && add-apt-repository ppa:ondrej/php \
    && sed -i "s/ppa\.launchpad\.net/launchpad.proxy.ustclug.org/g" /etc/apt/sources.list.d/*.list
