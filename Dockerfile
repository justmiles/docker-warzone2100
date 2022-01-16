FROM ubuntu:20.04

ARG version

RUN apt-get -u update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install curl xdg-utils libcurl3-gnutls libfreetype6 libharfbuzz0b libogg0 libopenal1 libphysfs1 libpng16-16 libsdl2-2.0-0 libsodium23 libtheora0 libvorbis0a libvorbisfile3 \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sfLo /tmp/warzone2100.deb https://github.com/Warzone2100/warzone2100/releases/download/${version}/warzone2100_ubuntu20.04_amd64.deb \
  && dpkg -i /tmp/warzone2100.deb \
  && rm -rf /tmp/warzone2100.deb

COPY autohost /usr/share/warzone2100/autohost

EXPOSE 2100

CMD [ "warzone2100","--enablelobbyslashcmd","--nosound","--headless","--autogame","--autohost=game.json" ]
