#!/bin/sh

/start-selenium.sh &
while ! timeout 1 bash -c "echo > /dev/tcp/localhost/4444 2>/dev/null"; echo "waiting for selenium"; do sleep 2; done
