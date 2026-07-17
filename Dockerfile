FROM golang:1.25.0-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . ./
RUN go build -o 12sprint .

FROM alpine:latest AS app
WORKDIR /app
COPY --from=builder /app/12sprint ./
ENTRYPOINT [ "./12sprint" ]
