# Build stage: Compile the Go gateway application
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o gateway

# Final stage: Create lightweight runtime image
FROM alpine:3.18

WORKDIR /app
# Copy only the compiled binary from builder stage
COPY --from=builder /app/gateway /app/gateway

# Expose the gateway port
EXPOSE 8081

# Run the gateway binary
CMD ["./gateway"]