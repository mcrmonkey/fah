FROM debian:stable-slim

ENV FAH_VER_MINOR=7.5.1
ENV FAH_VER_MAJOR=7.5

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -qq bzip2 ca-certificates

RUN mkdir -p /etc/fahclient && touch /etc/fahclient/config.xml

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VER_MAJOR}/fahclient_${FAH_VER_MINOR}_amd64.deb /tmp/fah.deb

RUN dpkg -i /tmp/fah.deb

RUN apt-get autoremove -y &&\
    rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/

EXPOSE 7396

ENTRYPOINT ["FAHClient", "--web-allow=0/0:7396", "--allow=0/0:7396"]
CMD ["--user=Anonymous", "--team=0", "--gpu=false", "--smp=true", "--power=full"]
