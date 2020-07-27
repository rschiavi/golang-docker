FROM golang:1.14.6-alpine3.12 as builder

WORKDIR /go/src/

COPY . .

RUN GOOS=linux go build -ldflags="-s -w" -o app

FROM scratch

COPY --from=builder /go/src/app .

CMD ["./app"]
