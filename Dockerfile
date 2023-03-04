FROM ubuntu:focal

COPY vendor /vendor
COPY patch /

RUN apt-get update \
  && apt-get install -y gcc-multilib make patch \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && patch -p1 < /patch \
  && cd /vendor/klic-3.013 \
  && make \
  && make install \
  && rm -rf /vendor \
  && rm /patch

ENV LD_LIBRARY_PATH /usr/local/lib
