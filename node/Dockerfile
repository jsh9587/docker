# Node.js 이미지 기반 (최신 LTS 버전)
FROM node:20

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# Git 설치 (만약 Git이 필요하다면)
RUN apt-get update && apt-get install -y git

# 소스 코드를 GitHub에서 클론
RUN git clone https://github.com/jsh9587/crm-front.git .

WORKDIR /usr/src/app/crm-front

# 패키지 설치
RUN npm install

# 빌드 명령어 실행 (배포를 위한 빌드)
RUN npm run build

# 포트 노출
EXPOSE 3000

# 애플리케이션 실행
CMD ["npm", "start"]
