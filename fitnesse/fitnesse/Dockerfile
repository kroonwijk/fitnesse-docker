FROM kroonwijk/headless

RUN mkdir /fitnesse
RUN wget -O /fitnesse/fitnesse-standalone.jar "http://www.fitnesse.org/fitnesse-standalone.jar?responder=releaseDownload&release=20150226"

COPY start-fitnesse.sh /
COPY start-fitnesse-daemon.sh /
COPY run-tests.sh /

RUN chmod u+x *.sh

CMD /start-fitnesse.sh


