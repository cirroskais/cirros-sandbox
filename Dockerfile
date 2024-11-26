FROM debian:stable-slim
WORKDIR /home/gmod

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt upgrade -y \
    && apt install -y tar curl lib32gcc-s1 lib32stdc++6 lib32z1 libncurses5-dev:i386 \
    && useradd -m -d /home/gmod gmod

RUN mkdir -p ./steamcmd \
    && curl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar -xzvf steamcmd.tar.gz -C ./steamcmd \
    && rm steamcmd.tar.gz

RUN ./steamcmd/steamcmd.sh +quit

RUN mkdir -p ./.steam/sdk32 \ 
    && cp -v ./steamcmd/linux32/steamclient.so ./.steam/sdk32/steamclient.so \
    && mkdir -p ./.steam/sdk64 \ 
    && cp -v ./steamcmd/linux64/steamclient.so ./.steam/sdk64/steamclient.so

EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27005/udp

COPY ./entrypoint.sh entrypoint.sh
CMD [ "bash", "entrypoint.sh" ]