FROM ubuntu:latest
COPY Test /
RUN chown root:root /Test
RUN chmod -R 777 /Test
##ENTRYPOINT ["/bin/bash"]
CMD ["/Test"]
##CMD cat Test
##RUN cat /Test
