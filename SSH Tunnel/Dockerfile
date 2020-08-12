ARG BUILD_FROM
FROM $BUILD_FROM

ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Install requirements for add-on
RUN apk add --no-cache openssh jq python

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
    
CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"