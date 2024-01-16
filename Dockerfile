FROM node:14-alpine as step1
WORKDIR react
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=step1 /react/build /usr/share/nginx/html