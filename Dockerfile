FROM ubuntu:latest
COPY Test /
CMD echo 'TEST'
CMD ["/bin/bash"]
CMD ["cat Test"]
