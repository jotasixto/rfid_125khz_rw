FROM ubuntu:xenial

WORKDIR /home/rfid

RUN apt-get update -y
RUN apt-get upgrade -y 
RUN apt-get install -y software-properties-common \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y make \
                && apt-get install -y cmake=3.5.1-1ubuntu3 \
                && apt-get install -y \
                    gcc-4.9 g++-4.9 gcc-4.9-base \
                    gcc-4.8 g++-4.8 gcc-4.8-base \
                    gcc-4.7 g++-4.7 gcc-4.7-base \
                    gcc-4.6 g++-4.6 gcc-4.6-base \
                && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
                && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100
RUN apt-get install libusb-1.0-0-dev -y


COPY . .

RUN make 

WORKDIR /home/rfid

ENV PATH="/home/rfid:${PATH}"
#CMD [ "ctx-idrw-203", "v" ]

