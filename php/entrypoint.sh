#!/bin/sh

if [ ! -f "/usr/share/nginx/html/.setup_done" ]; then
    # 프로젝트 디렉토리 생성 및 GitHub에서 소스 코드 클론
    mkdir -p /usr/share/nginx/html/crm_api
    git clone https://github.com/jsh9587/crm_api.git \
    /usr/share/nginx/html/crm_api

    # Composer 패키지 설치
    composer install --no-interaction --prefer-dist \
    --optimize-autoloader \
    --working-dir=/usr/share/nginx/html/crm_api/crm

    touch /usr/share/nginx/html/.setup_done
fi

exec php-fpm
