#pragma once

#include <cuda.h>
#include <stdio.h>

__global__ void hello_GPU_2D(int* block);

void hello_GPU();