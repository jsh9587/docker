# Node.js 이미지 기반 (최신 LTS 버전)
FROM node:18-alpine

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# package.json과 package-lock.json 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 애플리케이션 소스 복사
COPY . .

# 포트 노출
EXPOSE 3000

# 애플리케이션 실행
CMD ["npm", "start"]
