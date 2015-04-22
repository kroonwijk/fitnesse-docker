#!/bin/sh

#start selenium server
/start-selenium-daemon.sh

#start fitnesse
/start-fitnesse-daemon.sh

#Start Fitnesse test, output to xml file
curl "http://localhost/FitNesse.UserGuide.TwoMinuteExample?test&format=xml" -o /result.xml

#And upload xml file to iTested (which updates iValidate)
#curl --noproxy .intranet -X PUT -T '/result.xml' 'http://itested.europe.intranet:8888/put/testresults/xml/zBHPWADemo/00.00.01.001/demo'
