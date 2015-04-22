FROM debian:testing

#Timezone config
RUN echo "Europe/Amsterdam\n" > /etc/timezone
RUN /usr/sbin/dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y -q curl
