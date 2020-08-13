ARG BUILD_FROM
FROM $BUILD_FROM

ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

#Jackett dependentcies
RUN apk add --no-cache git icu-libs krb5-libs libintl libssl1.1 libstdc++ lttng-ust numactl zlib \

#install mono
RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

#build jackett from source
RUN git clone https://github.com/Jackett/Jackett.git \
    && cd Jackett/src \
    && dotnet publish Jackett.Server -f netcoreapp3.1 --self-contained -r linux-x64 -c Debug # takes care of everything \


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
    
CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"