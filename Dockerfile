FROM debian:stretch-20201117-slim

ARG FFMPEG_VERSION=""

RUN apt-get update; \    
    if [ "$FFMPEG_VERSION" = "" ]; \
    then \
        apt-get install -y ffmpeg; \
    else \
        apt-get install -y ffmpeg=$FFMPEG_VERSION; \
    fi

RUN rm -rf /var/lib/apt/lists

CMD ["--help"]
ENTRYPOINT [ "ffmpeg" ]

