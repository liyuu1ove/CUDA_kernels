#include <cuda.h>
#include "../hello/hello_GPU.h"
int main(){
cudaEvent_t start, stop;
cudaEventCreate(&start);
cudaEventCreate(&stop);

cudaEventRecord(start); // 记录起始时间
hello_GPU(); // 执行内核
cudaEventRecord(stop);  // 记录结束时间
cudaEventSynchronize(stop);
float time_ms;
cudaEventElapsedTime(&time_ms, start, stop);
printf("Kernel time: %f ms\n", time_ms);

cudaEventDestroy(start);
cudaEventDestroy(stop);
}