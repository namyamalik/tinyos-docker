FROM ubuntu:14.04
WORKDIR /root
RUN apt-get update && \
    apt-get install -y build-essential wget git python3 python openjdk-7-jdk automake emacs bison flex gperf python-dev vim nmap && \
    git clone git://github.com/tinyos/nesc.git && \
    cd nesc && \
    ./Bootstrap && \
    ./configure && \
    make && \
    make install
WORKDIR /root
RUN git clone git://github.com/tinyos/tinyos-main.git && \
    cd tinyos-main/tools && \
    ./Bootstrap && \
    ./configure && \
    make && \
    make install
