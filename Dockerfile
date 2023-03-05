FROM ubuntu:focal

COPY vendor/klic-3.013.tgz /

RUN apt-get update \
  && apt-get install -y gcc-multilib make patch \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && tar xf /klic-3.013.tgz \
  && cd /klic-3.013/runtime/config/shm/ \
  && unlink lock.s \
  && ln -s ./INTEL/lock.s \
  && cd /klic-3.013 \
  && make \
  && make install \
  && rm -rf /vendor

ENV LD_LIBRARY_PATH /usr/local/lib
