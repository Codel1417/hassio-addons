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
    cd ~ \
    && apk add --no-cache \
        bash \
        python3-dev \
        py-pip \
        libffi-dev \
        openssl-dev \
        gcc \
        git \
        make \
        libc-dev \
        curl \
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing --allow-untrusted \
        sd
RUN pip install --quiet docker-compose~=1.23.
RUN git clone https://github.com/TheSpaghettiDetective/TheSpaghettiDetective.git \
    && cd TheSpaghettiDetective 
RUN sd $oldVolume $newVolume docker-compose.yaml 
RUN docker-compose up -d
# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"