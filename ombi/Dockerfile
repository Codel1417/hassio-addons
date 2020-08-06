ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN echo "deb [arch=amd64,armhf] http://repo.ombi.turd.me/stable/ jessie main" | tee "/etc/apt/sources.list.d/ombi.list" \
    && wget -qO - https://repo.ombi.turd.me/pubkey.txt | apt-key add - \
    && apt update && sudo apt install ombi \
    && rm /etc/systemd/system/ombi.service

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"