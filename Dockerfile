FROM scratch
COPY hello /
CMD echo 'TEST'
CMD ["/hello.asm"]
