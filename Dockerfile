FROM debian:buster-20210111-slim

# none for latest version
ARG FFMPEG_VERSION=""

RUN apt-get update; \    
    if [ "$FFMPEG_VERSION" = "" ]; \
    then \
        apt-get install -y ffmpeg; \
    else \
        apt-get install -y ffmpeg=$FFMPEG_VERSION; \
    fi; \    
    apt-get clean
