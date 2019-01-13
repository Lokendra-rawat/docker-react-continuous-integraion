# Build phase
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /usr/app/build <---- all the stuff we care about for production 

FROM nginx
EXPOSE 80
# WORKDIR /usr/app
COPY --from=builder /usr/app/build /usr/share/nginx/html
