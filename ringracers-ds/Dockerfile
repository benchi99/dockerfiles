FROM debian:12-slim as builder

ARG VERSION=2.0

# Update apt and install dependencies/required tools
RUN apt-get update
RUN apt-get install -y git gcc cmake build-essential libcurl4-openssl-dev zlib1g libpng-dev libogg-dev libvorbis-dev libvpx-dev libyuv-dev libsdl2-dev ninja-build

# Clone project and build
WORKDIR /ringracers-source
RUN git clone https://git.do.srb2.org/KartKrew/RingRacers.git . \
    && git checkout v$VERSION \
    && cmake --preset ninja-release \
    && cmake --build --preset ninja-release

FROM debian:12-slim

ARG VERSION=2.0

WORKDIR /ringracers
VOLUME /data

# Update apt and install dependencies/required tools
RUN apt-get update \
    && apt-get install -y wget unzip libcurl4-openssl-dev zlib1g libpng-dev libogg-dev libvorbis-dev libvpx-dev libyuv-dev libsdl2-dev

# Get and extract assets, symlink volume to data folder
RUN wget https://github.com/KartKrewDev/RingRacers/releases/download/v$VERSION/Dr.Robotnik.s-Ring-Racers-v$VERSION-Assets.zip \
    && unzip Dr.Robotnik.s-Ring-Racers-v$VERSION-Assets.zip \
    && ln -s /data /root/.ringracers

# Copy executable to output directory
COPY --from=builder /ringracers-source/build/ninja-release/bin/ringracers_v$VERSION /ringracers/ringracers
# Copy startup script
COPY ./startserver.sh /ringracers/startserver.sh

EXPOSE 5029/udp

STOPSIGNAL SIGINT

ENTRYPOINT ["sh", "./startserver.sh"]