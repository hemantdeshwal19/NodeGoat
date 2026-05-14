FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app .

USER node

EXPOSE 4000

CMD ["npm", "start"]
