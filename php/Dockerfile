# PHP 8.3 이미지 기반
FROM php:8.3-fpm

# 시스템 패키지 및 PHP 확장 설치 및 Composer 설치
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libpq-dev libzip-dev unzip libonig-dev git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

# PHP 설정 파일을 복사합니다 (옵션)
# COPY ./php.ini /usr/local/etc/php/

WORKDIR /usr/share/nginx/html

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]