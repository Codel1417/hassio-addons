FROM debian:stable
ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8


#install Prerequisites 
RUN apt install mono-complete nuget msbuild dotnet-sdk-3.1 git libicu63 libssl1.1

#build jackett from source
RUN git clone https://github.com/Jackett/Jackett.git \
    && cd Jackett/src \
    && dotnet publish Jackett.Server -f netcoreapp3.1 --self-contained -r linux-x64 -c Debug


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
    
CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"