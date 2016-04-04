FROM ubuntu:latest
COPY Test /
CMD echo 'TEST'
CMD ["/Test"]
