# 기본 이미지
FROM node:16-alpine

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# package.json과 package-lock.json 복사
COPY package*.json ./

# 의존성 설치 (Production 모드만)
RUN npm install --production

# 애플리케이션 코드 복사
COPY . .

# NOTE : 포트 설정
ENV PORT=3000

# 포트 노출
EXPOSE 3000

# 애플리케이션 실행 명령
CMD ["node", "app.js"]
