# No build step in Docker -> tiết kiệm RAM
FROM node:18-alpine

RUN yarn global add serve

WORKDIR /app
COPY ./build ./build

EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
