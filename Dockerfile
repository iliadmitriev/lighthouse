FROM alpine

RUN apk add --no-cache npm chromium

RUN npm install -g --no-cache lighthouse

RUN adduser -u 1000 -D chrome chrome

RUN mkdir /home/chrome/reports && chown -R chrome:chrome /home/chrome

USER chrome

WORKDIR /home/chrome/reports