FROM golang:alpine as build

ENV GO111MODULE=on

ARG VERSION

LABEL description="Simple API Golang"
LABEL repository="https://github.com/mrofisr/simple"
LABEL maintainer="mrofisr"

RUN apk update && apk add --no-cache git

WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /app

COPY --from=build /app/main /app/main

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000
CMD [ "/app/main" ]