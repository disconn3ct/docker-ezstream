FROM alpine:3.20

LABEL maintainer="Ben Speakman <ben@3sq.re>"

ARG UID=1000
ARG GID=1000

RUN apk -q update \
    && apk --no-cache --no-progress add ezstream vorbis-tools \
    && rm -rf /var/cache/apk/*

VOLUME ["/ezstream", "/music"]

USER $UID:$GID

ENTRYPOINT ["/usr/bin/ezstream", "-c", "/ezstream/ezstream.xml"]

