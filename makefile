CC = g++
NVCC=nvcc
LIB = -lcublas -lcudnn
PROGRAM = run.cu
OBJS = main.o kernel.o
TARGET = main
CFLAGS = -std=c++20
NVCC_FLAGS = -arch=sm_89
LDFLAGS = 
all:$(TARGET)
$(TARGET):main.o kernel.o
	$(NVCC) -o $@ $^ $(LDFLAGS)
main.o:main.cpp kernel.h
	$(CC) $(CFLAGS) -c $< -o $@
kernel.o: kernel.cu kernel.h
	$(NVCC) $(NVCC_FLAGS) -c $< -o $@
clean:
	del -force $(OBJS) $(TARGET)
run:
	./$(TARGET)

test:
	g++ testbench/test.cpp $(FLAGS) -o test
	./test
clean_test:
	del -force test.exe
.PHONY: all clean run test