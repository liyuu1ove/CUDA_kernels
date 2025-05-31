#include "matmul.cuh"

__global__ void matmul_v1(float* A,float* B,float* C,int M,int N,int K){
    int x=blockIdx.x*blockDim.x+threadIdx.x;
    int y=blockIdx.y*blockDim.y+threadIdx.y;
    if(row<M&&col<K){
        float temp=0;
    for(int i=0;i<N;i++){
        temp+=A[row*N+i]*B[i*K+col];
        }
        C[row*K+col]=temp;
    }
}
template<int BLOCKSIZE>
__global__ void matmul_v2(float* A,float* B,float* C,int M,int N,int K){

}
