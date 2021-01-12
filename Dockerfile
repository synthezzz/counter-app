FROM node:10.23.1-alpine3.9
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "start"]

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


#123