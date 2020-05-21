FROM yuanzhen869/ubuntu1804
MAINTAINER yuanzhen <575173869@qq.com>

#配置自动选择默认配置安装tzdata
ENV DEBIAN_FRONTEND=noninteractive

# 安装PHP
RUN apt-get install -y php7.2 \
    && apt-get install -y php7.2-bcmath php7.2-fpm php7.2-bz2 php7.2-dba php7.2-enchant php7.2-imap php7.2-interbase php7.2-intl php7.2-mbstring php7.2-phpdbg php7.2-soap php7.2-sybase php7.2-xsl php7.2-zip php7.2-xmlrpc php7.2-xml php7.2-tidy php7.2-sqlite3 php7.2-snmp php7.2-recode php7.2-readline php7.2-pspell php7.2-pgsql php7.2-opcache php7.2-odbc php7.2-mysql php7.2-pdo-mysql php7.2-ldap php7.2-json php7.2-gmp php7.2-gd php7.2-dev php7.2-curl php7.2-common php7.2-cli php7.2-cgi php7.2-redis \
    && apt-get install php7.2-mbstring \
    && apt-get install php7.2-pdo-mysql \
    && sed -i 's/^listen = \/run\/php\/php7.2-fpm.sock/listen = 9000/' /etc/php/7.2/fpm/pool.d/www.conf \
    && mkdir -p /data/www/ \
    && chown -R www-data:www-data /data/www/

# 安装nginx
RUN apt-get install -y nginx \
    && echo 'daemon off;' >> /etc/nginx/nginx.conf \
    && sed -i 's/^//' /etc/nginx/nginx.conf \
    && sed -i '/sites-enabled/d' /etc/nginx/nginx.conf

# 配置ngix vhost
COPY ./default.conf /

# 添加启动脚本
COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

# 申明暴露端口
EXPOSE 80 443

# 申明挂载点
VOLUME [ "/etc/nginx/conf.d" "/var/www/http" "/data/www/" ]

# 申明启动脚本
ENTRYPOINT [ "/entrypoint.sh" ]

