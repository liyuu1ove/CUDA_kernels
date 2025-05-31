#include <stdio.h>
#include "kernel.h"

__global__ void my_kernel() {
    printf("Hello from GPU thread %d\n", threadIdx.x);
}

void hello_warpper() {
    // 启动GPU核函数
    my_kernel<<<1, 5>>>();  // 1个block，5个线程
    cudaDeviceSynchronize(); // 等待GPU完成
}