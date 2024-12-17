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

# Build-time ARG 설정
ARG REACT_APP_API_URL
ARG SECRET_KEY
ARG PORT

# ARG를 런타임 ENV로 변환
ENV REACT_APP_API_URL=${REACT_APP_API_URL}
ENV SECRET_KEY=${SECRET_KEY}
ENV PORT=${PORT}

# NOTE: 포트 노출
EXPOSE ${PORT}

# 애플리케이션 실행 명령
CMD ["node", "app.js"]
