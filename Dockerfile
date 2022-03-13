# Tahap 1 : Membuat Binnary Go
FROM golang:1.13.4-alpine

RUN apk update && apk add --no-cache git 
WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY . .
ENV GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -a -installsuffix cgo -ldflags="-s -w" -o main .

EXPOSE 3000
CMD [ "/app/main" ]