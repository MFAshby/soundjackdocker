FROM ubuntu:16.04

# Install deps
RUN apt-get update &&\
  apt-get install -y \
   libasound2 \
   alsa-utils \
   jackd2 \
   libqt5widgets5 \
   libqt5opengl5 \
   libpulse0

# Copy files & set env vars
RUN mkdir /soundjack
COPY . /soundjack
WORKDIR /soundjack
ENV LD_LIBRARY_PATH=/soundjack

ARG user
ARG uid
ARG gid

RUN groupadd -g ${gid} ${user}
RUN useradd -u ${uid} -g ${gid} ${user} -G audio -m
USER ${user}

ENTRYPOINT ["dbus-run-session"]
CMD ["./SJC200828.sh"]
