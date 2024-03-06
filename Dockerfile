FROM node:21-alpine AS client

WORKDIR /app

COPY ui/package*.json .
COPY ui/*config.js .

RUN npm install

COPY ui/ .

RUN npm run build

FROM denoland/deno:alpine-1.37.0

WORKDIR /app

COPY api/ /app/

RUN deno cache app-run.js

COPY --from=client /app/build /app/static

CMD ["run", "--allow-net", "--allow-read=static", "app-run.js"]
