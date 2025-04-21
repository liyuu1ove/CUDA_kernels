all:
	nvcc hello/hello_GPU.cu -o test
clean:
	rm -f test

run:
	./test