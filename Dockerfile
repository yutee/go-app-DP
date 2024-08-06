# stage 1 - build the binary
FROM golang:1.22.5 AS builder

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

# Set the target OS and architecture
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# stage 2 - using distroless image
FROM gcr.io/distroless/base

WORKDIR /app

COPY --from=builder /app/main .

COPY --from=builder /app/static ./static

EXPOSE 8080

CMD ["./main"]