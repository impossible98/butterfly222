# alpha
FROM golang:1.18 as alpha

WORKDIR /src

COPY ./ ./

RUN go mod download
RUN go build -ldflags "-s -w" -o ./dist/butterfly ./cmd/butterfly/main.go
# beta
FROM scratch

COPY --from=alpha /src/dist /app

ENTRYPOINT ["/app/butterfly"]
