#include "hello_GPU.h"



__global__ void hello_GPU_1D(){
    int index=threadIdx.x+blockIdx.x*blockDim.x;
    printf("Hello from thread:%d in block:%d thread%d \n",index,blockIdx.x,threadIdx.x);
}

void hello_GPU(){
    dim3 grid_1D={2,1,1};
    dim3 block_1D={32,1,1};
    hello_GPU_1D<<<grid_1D,block_1D>>>();
    cudaDeviceSynchronize();
}