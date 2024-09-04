# PHP 8.3 이미지 기반
FROM php:8.3-fpm

# 시스템 패키지 및 PHP 확장 설치
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    vim \
    libpq-dev libzip-dev unzip libonig-dev git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && docker-php-ext-enable pdo_mysql

# Node.js 및 npm 설치
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

# Composer 설치
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 작업 디렉토리 설정
WORKDIR /usr/share/nginx/html

# 엔트리포인트 스크립트 복사 및 실행 권한 부여
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 엔트리포인트 설정
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
