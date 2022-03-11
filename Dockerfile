# Tahap 1 : Membuat Binnary Go
FROM golang:alpine as build

ENV GO111MODULE=on
ENV USER=appuser
ENV UID=10001

RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates
RUN adduser \    
    --disabled-password \    
    --gecos "" \    
    --home "/nonexistent" \    
    --shell "/sbin/nologin" \    
    --no-create-home \    
    --uid "${UID}" \    
    "${USER}"
WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY . .
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -a -installsuffix cgo -ldflags="-s -w" -o main .

# Tahap 2 : Memindahkan Binnary Go

FROM busybox

WORKDIR /app

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /etc/group /etc/group
COPY --from=build /app/main /app/main

USER appuser:appuser

EXPOSE 3000
CMD [ "/app/main" ]