FROM golang:alpine3.16 as build

WORKDIR /app
COPY . .
RUN go build -o myapp
CMD [ "./myapp" ]

FROM alpine:latest
COPY --from=build /app/myapp .
EXPOSE 8000
CMD [ "./myapp" ]