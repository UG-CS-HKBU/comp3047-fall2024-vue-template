FROM node:current-alpine as build

COPY . /app
WORKDIR /app

RUN npm install && npm run build

ARG EXPRESS_REPO
FROM ${EXPRESS_REPO}

COPY --from=build /app/dist /app/public
RUN sed -i 's/next(createError(404));/res.status(404).sendFile(path.join(__dirname, "public", "index.html"));/' /app/app.js