FROM ubuntu:latest
COPY Test /
CMD echo 'TEST'
RUN chown root:root /Test
RUN chmod -R 777 /Test
CMD ["/bin/bash"]
#CMD ["/Test"]
RUN cat /Test
