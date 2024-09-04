#!/bin/sh

# 설정 완료 상태 파일이 있는지 확인합니다
if [ ! -f "/usr/share/nginx/html/.setup_done" ]; then
    # 프로젝트 디렉토리 생성 및 GitHub에서 소스 코드 클론
    mkdir -p /usr/share/nginx/html/crm_api
    git clone https://github.com/jsh9587/crm_api.git \
    /usr/share/nginx/html/crm_api

    # Composer 패키지 설치
    composer install --no-interaction --prefer-dist \
    --optimize-autoloader \
    --working-dir=/usr/share/nginx/html/crm_api/crm

    # 설정 완료 상태 파일 생성
    touch /usr/share/nginx/html/.setup_done

    # 권한 설정
    # www-data 사용자가 있는지 확인하고, 그렇지 않으면 사용자 생성
    if id "www-data" &>/dev/null; then
        echo "www-data 사용자 확인됨."
    else
        echo "www-data 사용자가 존재하지 않아 생성합니다."
        groupadd -g 33 www-data
        useradd -u 33 -g www-data -s /usr/sbin/nologin www-data
    fi

    # 권한 설정 (PHP 컨테이너 내부)
    chown -R www-data:www-data /usr/share/nginx/html/
    chmod -R 775 /usr/share/nginx/html/
fi

# php-fpm 실행
exec php-fpm
