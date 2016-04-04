Test: hello.asm
	nasm -o $@ $<
	chmod +x Test

.PHONY: clean
clean:
	-rm -vf Test

.PHONY: test
test: Test
	./Test
