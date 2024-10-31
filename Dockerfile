ARG EXPRESS_REPO
FROM ${EXPRESS_REPO}

COPY dist/* /app/public/
RUN sed -i 's/next(createError(404));/res.status(404).sendFile(path.join(__dirname, "public", "index.html"));/' /app/app.js