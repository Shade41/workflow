FROM node:14.2.0-alpine3.11 as builder
WORKDIR /app/workflow
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/workflow/build /usr/share/nginx/html