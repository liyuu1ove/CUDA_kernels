#pragma once

#include <cuda.h>

__global__ void matmul_v1(float* A,float* B,float* C,int M,int N,int K);
//compute C=A*B A:M*N B:N*K C:M*K

template<int BLOCKSIZE>
__global__ void matmul_v2(float* A,float* B,float* C,int M,int N,int K);