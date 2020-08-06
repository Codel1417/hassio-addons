ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN "mkdir /opt/Ombi \
    && cd /opt/Ombi  \
    && apt update \
    && apt install -y libicu-dev libunwind8 libcurl4-openssl-dev wget tar \
    && wget https://github.com/tidusjar/Ombi/releases/download/v3.0.5202/linux.tar.gz \
    && tar xzf linux.tar.gz \
    && rm linux.tar.gz \
    && chmod +x Ombi"


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"