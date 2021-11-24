FROM golang:1.17 AS builder
WORKDIR /go/src/go-sample
COPY . .
RUN GOOS=linux go build ./app.go

FROM scratch
WORKDIR /go/src/go-sample
COPY --from=builder /go/src/go-sample/app .
CMD ["/go/src/go-sample/app"]