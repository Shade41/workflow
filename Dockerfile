FROM node:14.2.0-alpine3.1
WORKDIR /app/workflow
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/workflow/build /usr/share/nginx/html