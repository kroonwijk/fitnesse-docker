#!/bin/sh

logging=/var/log/selenium.log

echo starting headless X.org server, display :0
/etc/init.d/xvfb start
echo -----------
echo Selenium is logging to $logging
echo -----------
echo starting Selenium standalone, port 4444
google-chrome --remote-debugging-port=9222 --user-data-dir=/root &
java -jar /selenium-server/selenium-server-standalone-2.43.1.jar \
-trustAllSSLCertificates \
-Dwebdriver.firefox.profile=docker \
>> $logging
