FROM ubuntu:latest
COPY Test /
CMD echo 'TEST'
RUN chmod -R 777 /Test
CMD ["/bin/bash"]
CMD ["/Test"]
