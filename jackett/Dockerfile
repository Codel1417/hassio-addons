FROM debian:buster
ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8


#install Prerequisites 
RUN apt-get update && apt-get install -y apt-transport-https wget
RUN \
    wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt update \
    && apt install -y mono-complete nuget git libicu63 libssl1.1 dotnet-sdk-3.1

#build jackett from source
RUN \
    cd ~ \
    && git clone https://github.com/Jackett/Jackett.git \
    && cd Jackett/src \
    && dotnet publish Jackett.Server -f netcoreapp3.1 --self-contained -r linux-x64 -c Debug


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
    
CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"