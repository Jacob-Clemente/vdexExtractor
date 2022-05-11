# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake libz-dev

## Add source code to the build stage.
ADD . /vdexExtractor
WORKDIR /vdexExtractor

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN ./make.sh

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /vdexExtractor/bin/vdexExtractor /

