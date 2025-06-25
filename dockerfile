# Build stage
FROM node:18-alpine as builder

WORKDIR /app
COPY . .

RUN yarn install
RUN yarn build

# Serve stage
FROM node:18-alpine

RUN yarn global add serve

WORKDIR /app
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
