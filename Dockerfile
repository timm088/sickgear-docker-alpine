FROM python:2.7-alpine

ENV LANG='en_AU.UTF-8' \
    LANGUAGE='en_AU.UTF-8' \
    SICKGEAR_VERSION='0.12.23'

RUN apk -U upgrade && \
    apk add --no-cache \
      ca-certificates \
      wget \
      git \
      openssl \
      tar \
      curl \
      tzdata \
      libxml2 \
      libxml2-dev \
      libxslt \
      libxslt-dev \
      musl-dev \
      gcc && \
\
    pip install --no-cache-dir \
      lxml && \
\
    adduser -u 1001 -S media -G users && \
    mkdir /data /tvseries /incoming && \
    chown -R media:users /data /tvseries /incoming && \
\
    mkdir /sickgear && \
    wget https://github.com/SickGear/SickGear/archive/release_${SICKGEAR_VERSION}.tar.gz && \
    tar -xf release_${SICKGEAR_VERSION}.tar.gz --strip 1 -C /sickgear && \
    chown -R media:users /sickgear && \
\
    pip install --no-cache-dir -r /sickgear/requirements.txt && \
\
    rm ./release_${SICKGEAR_VERSION}.tar.gz && \
\
    apk del \
      gcc \
      libxml2-dev \
      libxslt-dev \
      wget \
      musl-dev

EXPOSE 8081

USER media

VOLUME ["/data", "/tvseries", "/incoming"]

CMD ["/usr/local/bin/python", "/sickgear/SickBeard.py", "--datadir", "/data", "--config", "/data/config.ini"]
