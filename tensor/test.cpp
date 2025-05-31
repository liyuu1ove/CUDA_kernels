#include "tensor.cpp"

int main(){
    std::vector<int> shape={2,3};
    Tensor_fp32 tensor(shape,Tensor_fp32::Initializer::Rand);
    return 0 ;

}