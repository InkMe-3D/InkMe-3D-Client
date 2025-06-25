# Stage 1: Build React app
FROM node:18-alpine AS builder

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ source code vào container
COPY . .

# Cài đặt dependencies
RUN yarn install

# Build ứng dụng (React)
RUN yarn build

# -----------------------------------------

# Stage 2: Serve app bằng "serve"
FROM node:18-alpine

# Cài đặt serve để phục vụ các file tĩnh
RUN yarn global add serve

# Tạo thư mục làm việc
WORKDIR /app

# Copy từ stage build vào thư mục /app
COPY --from=builder /app/build ./build

# Expose port 3000 (hoặc 80 nếu bạn muốn)
EXPOSE 3000

# Lệnh chạy server
CMD ["serve", "-s", "build", "-l", "3036"]