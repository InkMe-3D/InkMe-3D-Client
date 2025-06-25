# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

RUN yarn install
RUN yarn build

# Stage 2: Serve
FROM node:18-alpine

RUN yarn global add serve

WORKDIR /app
COPY --from=builder /app/build ./build

EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
