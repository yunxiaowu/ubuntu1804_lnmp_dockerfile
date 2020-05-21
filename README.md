# Ubuntu1804_lnmp_Dockerfile

基于Ubuntu18.04构建LNMP环境的Dockerfile
替换163镜像源

## 环境说明
php7.2+Nginx
！！！mysql下次更新，敬请期待

## 构建镜像

```
docker build -t yuanzhen:lnmp ./
```

## 构建容器
```
docker run -itd \
-p 80:80 \
-p 443:443 \
-v /data/opt/lnmp/nginx:/etc/nginx/conf.d \
-v /data/opt/lnmp/www:/data/www \
-u 0:0 \
--name lnmp \
--privileged=true \
--restart=always \
--network=base \
--ip=172.27.1.27 \
yuanzhen:lnmp
```

## 修改nginx虚拟主机配置

进入已挂载出来的nginx配置目录
```
cd /data/opt/lnmp/nginx
```
编辑`default.conf`文件
```
vim default.conf
```
修改`主机域名`及`程序主目录`

```
# 你的域名
server_name localhost;
# 程序的安装路径
root /data/www;
```

## 上传程序至/data/opt/lnmp/www/


## 访问：[http://192.168.1.1:80](http://192.168.1.1:80)

## 完成

