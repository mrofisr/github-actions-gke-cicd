FROM golang:alpine as build

ENV GO111MODULE=on

WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY . .
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -a -installsuffix cgo -ldflags="-s -w" -o main .

FROM scratch

WORKDIR /app

COPY --from=build /app/main /app/main

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 3000
CMD [ "/app/main" ]