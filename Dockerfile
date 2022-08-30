FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV NS3_VERSION=3.33

RUN apt update \
&& apt install -y --no-install-recommends \
    software-properties-common

RUN add-apt-repository ppa:sumo/stable \ 
&& apt install -y --no-install-recommends \
    sumo sumo-tools sumo-doc

RUN apt install -y --no-install-recommends \
    sumo sumo-tools sumo-doc \
    gcc g++ python python3 python3-setuptools git mercurial qt5-default \
	openmpi-bin openmpi-common openmpi-doc libopenmpi-dev \
    autoconf cvs bzr unrar \
    gdb valgrind uncrustify \
    python3-sphinx dia gsl-bin libgsl-dev libgslcblas0 \
    tcpdump sqlite sqlite3 libsqlite3-dev \
    libxml2 libxml2-dev \
    libgtk2.0-0 libgtk2.0-dev \
    libgsl23 \
    nodejs

WORKDIR /workspace
RUN git clone https://github.com/ms-van3t-devs/ms-van3t
WORKDIR /workspace/ms-van3t

RUN touch bash
RUN tail -n +77 ./sandbox_builder.sh | bash
RUN rm ./sandbox_builder.sh
WORKDIR /workspace/ms-van3t/ns-${NS3_VERSION}
RUN ./waf configure --build-profile=optimized --enable-examples --enable-tests --disable-werror
RUN ./waf build
