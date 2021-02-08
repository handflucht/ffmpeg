FROM debian:stretch-20201117-slim

ARG FFMPEG_VERSION = ""

# hadolint ignore=DL3008 
RUN apt-get update; \    
    if [ "$FFMPEG_VERSION" = "" ]; \
    then \
        apt-get install -y --no-install-recommends ffmpeg; \
    else \
        apt-get install -y --no-install-recommends ffmpeg=$FFMPEG_VERSION; \
    fi; \    
    apt-get clean  && rm -rf /var/lib/apt/lists/*;
    
RUN rm -rf /var/lib/apt/lists

ENTRYPOINT [ "ffmpeg" ]
CMD ["--help"]
