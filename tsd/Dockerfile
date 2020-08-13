ARG BUILD_FROM=docker:stable
FROM $BUILD_FROM

ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
ARG oldVolume="     - ./web:/app"
ARG newVolume="     - /data:/app"
# Install requirements for add-on
RUN \
    apk add --no-cache \
        bash \
        py-pip \
        libffi-dev \
        openssl-dev \
        gcc \
        git \
        make \
        libc-dev
RUN apk add --no-cache sd
RUN \
    && curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && git clone https://github.com/TheSpaghettiDetective/TheSpaghettiDetective.git \
    && cd TheSpaghettiDetective 
RUN sd $oldVolume $newVolume docker-compose.yaml 
RUN sudo docker-compose up -d
# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"