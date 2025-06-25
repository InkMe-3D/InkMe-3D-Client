# Build stage
FROM node:18-alpine as builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# Serve stage
FROM node:18-alpine

RUN npm install -g serve

WORKDIR /app
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
