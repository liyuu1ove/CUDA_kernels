#include "hello_GPU.h"
#define SIZE 2
#define BLOCKSIZE SIZE*SIZE*SIZE*SIZE


__global__ void hello_GPU_2D(int* block){
    int idx=blockIdx.x*blockDim.x+threadIdx.x;
    int idy=blockIdx.y*blockDim.y+threadIdx.y;

    int index=gridDim.x*blockDim.x*idy+idx;
    printf("Hello from thread:%d as number %d in block:(%d,%d) thread(%d,%d) \n"
        ,index,block[index],blockIdx.x,blockIdx.y,threadIdx.x,threadIdx.y);
}

void hello_GPU(){
    int block[BLOCKSIZE*BLOCKSIZE]={0};
    for(int i=0;i<BLOCKSIZE*BLOCKSIZE;i++){
        block[i]=i;
    }
    int * d_ptr=nullptr;
    cudaMalloc((void**)&d_ptr,BLOCKSIZE*BLOCKSIZE*sizeof(int));
    cudaMemcpy(d_ptr,block,BLOCKSIZE*BLOCKSIZE*sizeof(int),cudaMemcpyDefault);

    dim3 grid_1D={SIZE,SIZE};
    dim3 block_1D={BLOCKSIZE*SIZE,SIZE};
    hello_GPU_2D<<<grid_1D,block_1D>>>(d_ptr);
    cudaDeviceSynchronize();
    cudaFree(d_ptr);
}
