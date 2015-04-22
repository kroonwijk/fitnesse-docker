#!/bin/bash

/start-fitnesse.sh &

#Give stuff a second to start up
tail -f /fitnesse.debug | while read LOGLINE
do
   [[ "${LOGLINE}" == *"Files have been updated to a new version"* ]] && pkill -P $$ tail
done
echo Fitnesse started
