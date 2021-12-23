FROM golang:1.16.8-alpine3.14 as build

ARG VERSION

LABEL description="Simple API Golang"
LABEL repository="https://github.com/mrofisr/simple"
LABEL maintainer="mrofisr"

WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY . .
RUN go build .

FROM alpine:latest

COPY --from=build /app/simple /bin/simple
ENV HOME /

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000
ENTRYPOINT [ "/bin/simple" ]