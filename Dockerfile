FROM ubuntu:latest
COPY Test /
CMD echo 'TEST'
RUN chown root:root /Test
RUN chmod -R 777 /Test
ENTRYPOINT ["/bin/bash"]
#CMD ["/bin/bash"]
CMD cat Test
##RUN cat /Test
