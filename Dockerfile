FROM ubuntu:latest
COPY hello /
CMD echo 'TEST'
CMD ["/hello"]
