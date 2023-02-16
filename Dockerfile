FROM alpine/git:2.36.3

ENV BUILD_DEPS="gettext"  \
  RUNTIME_DEPS="libintl"

RUN set -x && \
  apk add --no-cache --update $RUNTIME_DEPS && \
  apk add --no-cache --virtual build_deps $BUILD_DEPS &&  \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del build_deps && \
  apk add --no-cache bash tzdata

ENTRYPOINT [ "bash" ]