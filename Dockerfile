FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o gateway

FROM alpine:3.18

WORKDIR /app
COPY --from=builder /app/gateway /app/gateway

EXPOSE 8081

CMD ["./gateway"]