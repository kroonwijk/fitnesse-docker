FROM kroonwijk/fitnesse

#Copy FitNesseRoot into container
#COPY FitNesseRoot/ /FitNesseRoot/

#Modify this hosts file (optional)
#ADD hosts-zBHPWA /tmp/hosts
#HACK - don't change
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override
#/HACK - don't change

#Copy run-tests.sh to container root
COPY run-tests.sh /
RUN chmod u+x run-tests.sh

#Set as default command (optional)
CMD /run-tests.sh
