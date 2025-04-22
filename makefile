LIB = -cublas
PROGRAM = testbench/test.cu hello/hello_GPU.cu
OBJ = 
TARGET = test
FLAGS = -std=c++20
all:
	nvcc $(PROGRAM) -o $(TARGET)
clean:
	del -force $(TARGET).exe $(TARGET).exp $(TARGET).lib
run:
	./$(TARGET)
.PHONY: all clean run