FROM ubuntu:18.04 AS jo-builder

RUN apt update && apt install -y git build-essential autoconf pkgconf
RUN git clone git://github.com/jpmens/jo.git && cd jo && autoreconf -i && ./configure && make check && make install

FROM openjdk:8-slim

COPY --from=jo-builder /jo/jo /usr/bin/jo
COPY entrypoint.sh entrypoint.sh

RUN apt -y update && apt install -y wget && wget https://firebase.tools/bin/linux/latest -O firebase && chmod +x firebase

ENV UI_PORT=4141

ENTRYPOINT ["./entrypoint.sh"]
