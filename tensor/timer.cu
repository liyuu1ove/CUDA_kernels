#include <cuda.h>
#include "../hello/hello_GPU.h"


int main(){
cudaEvent_t start, stop;
cudaEventCreate(&start);
cudaEventCreate(&stop);

cudaEventRecord(start); 
hello_GPU(); 
cudaEventRecord(stop); 
cudaEventSynchronize(stop);
float time_ms;
cudaEventElapsedTime(&time_ms, start, stop);
printf("Kernel time: %f ms\n", time_ms);

cudaEventDestroy(start);
cudaEventDestroy(stop);
}