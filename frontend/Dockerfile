# # build stage
FROM node:16-alpine as build
WORKDIR /app
COPY . .
RUN chmod -R 777 /app
RUN yarn install
RUN yarn add html-webpack-plugin
RUN yarn add tailwindcss
RUN yarn run build

# production stage
FROM nginx:alpine
COPY --from=build app/public/ /usr/share/nginx/html
EXPOSE 81
CMD ["nginx", "-g", "daemon off;"]
