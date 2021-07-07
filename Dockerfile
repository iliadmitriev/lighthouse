FROM alpine:3.14

RUN mkdir /app/ \
	&& apk add --no-cache npm chromium \
	&& npm install -g --no-cache lighthouse \
	&& rm -rf /var/cache/*

RUN adduser -D -u 1000 chrome \
	&& chown -R chrome:chrome /app

USER chrome

WORKDIR /app/
