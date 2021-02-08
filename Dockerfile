FROM debian:stretch-20201117-slim

ARG FFMPEG_VERSION=""

RUN apt-get update; \    
    if [ "$FFMPEG_VERSION" = "" ]; \
    then \
        # hadolint ignore=DL3008 
        apt-get install -y --no-install-recommends ffmpeg && apt-get clean  && rm -rf /var/lib/apt/lists/*; \
    else \
        apt-get install -y --no-install-recommends ffmpeg=$FFMPEG_VERSION && apt-get clean  && rm -rf /var/lib/apt/lists/*; \
    fi

RUN rm -rf /var/lib/apt/lists

CMD ["--help"]
ENTRYPOINT [ "ffmpeg" ]

