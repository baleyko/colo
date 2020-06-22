FROM golang:1.14-alpine AS build
ENV CGO_ENABLED 0
ENV GOOS "linux"
ENV GOARCH "amd64"
WORKDIR /build
ADD . .
RUN go build

FROM scratch AS release
COPY --from=build /build/colo /usr/bin/colo
ENTRYPOINT ["/usr/bin/colo"]
