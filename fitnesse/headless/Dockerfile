FROM kroonwijk/base-dev

#Install firefox
RUN echo "deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" | tee -a /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29
RUN apt-get update && apt-get install -q -y firefox-mozilla-build

#Install chrome-stable
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && apt-get install -q -y google-chrome-stable

#Install unzip
RUN apt-get update && apt-get install -q -y unzip

#Install Chromedriver
ENV CHROME_DRIVER_VERSION 2.14
RUN wget --no-verbose -O chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip -d /chromedriver

#Create symlinks for easy access to firefox and chrome(driver)
RUN ln -sf /opt/firefox/firefox /usr/bin/firefox
RUN ln -sf /chromedriver/chromedriver /usr/bin/chromedriver

#Install xvfb
RUN apt-get update && apt-get install -q -y xvfb
COPY xvfb/xvfb /etc/init.d/xvfb
RUN chmod +x /etc/init.d/xvfb
ENV DISPLAY :0

#Create Docker profile in firefox for automatic proxy use
RUN /etc/init.d/xvfb start && sleep 1 && firefox -CreateProfile docker
#Find newly created profile and set proxy.pac in prefs.js
#Bit hacky, but at least it's 'hidden' here, less confusing for user (run only once)
RUN find /root/.mozilla -wholename '*docker/prefs.js' -exec sh -c "echo 'user_pref(\"network.proxy.autoconfig_url\", \"file:///proxy/proxy.pac\");' >> {}" \;
RUN find /root/.mozilla -wholename '*docker/prefs.js' -exec sh -c "echo 'user_pref(\"network.proxy.type\", 2);' >> {}" \;

#Install selenium-server standalone
RUN mkdir /selenium-server
RUN wget -O /selenium-server/selenium-server-standalone-2.43.1.jar http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar

#Create start-selenium.sh - this handles Xvfb and starts Selenium on port 4444
COPY start-selenium.sh /

#And copy start-selenium-daemon.sh - This script is non-blocking for use downstream
COPY start-selenium-daemon.sh /
RUN chmod u+x *.sh

CMD echo "Don't forget to open port 4444 in Docker: -p 4444:4444" && \
/start-selenium.sh


