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


    # 권한 설정 (PHP 컨테이너 내부)
    chown -R www-data:www-data /usr/share/nginx/html/
    chmod -R 775 /usr/share/nginx/html/

    
fi

exec php-fpm
