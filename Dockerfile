FROM scratch
COPY hello /
RUN echo "TEST" 
CMD ["/hello.asm"]
