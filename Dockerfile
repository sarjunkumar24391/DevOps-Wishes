FROM ubuntu:latest
ADD hello /
CMD echo 'TEST'
CMD ["/hello"]
