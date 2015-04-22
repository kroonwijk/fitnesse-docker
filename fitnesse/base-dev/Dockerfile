FROM kroonwijk/base

#Install Java JDK
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections 
RUN apt-get update && apt-get install -y -q oracle-java7-installer
RUN apt-get update && apt-get install -y -q oracle-java8-installer

RUN update-alternatives --set java /usr/lib/jvm/java-7-oracle/jre/bin/java
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/jre

#Install maven
RUN apt-get update && apt-get install -y -q maven

#Install node and npm
RUN apt-get update && apt-get install -y -q nodejs-legacy
RUN apt-get update && apt-get install -y -q nodejs
RUN apt-get update && apt-get install -y -q npm

#Install gradle
RUN apt-get update && apt-get install -y gradle

#Install buildtools for javascript development - bower and grunt
RUN npm install -g bower
RUN npm install -g grunt
RUN npm install -g grunt-cli

#Install git
RUN apt-get install -y -q git

ENV GIT_SSL_NO_VERIFY true

#Copy proxy script
RUN apt-get update && apt-get install -y -q wget

#Clean up apt-repository
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
