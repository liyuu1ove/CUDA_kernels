#include "tensor.h"

Tensor_fp32::Tensor_fp32(const Shape& shape,Tensor_fp32::Initializer Init){
    shape_=shape;
    size_=1;
    for(int i=0;i<shape.size();i++){
        size_*=shape[i];
    }
    data_ = new float[size_];
    switch (Init)
    {
    case Tensor_fp32::Initializer::One:
        for(int i=0;i<size_;i++){
            data_[i]=1;
        }
        break;
    case Tensor_fp32::Initializer::Zero:
    for(int i=0;i<size_;i++){
        data_[i]=0;
    }
        break;
    case Tensor_fp32::Initializer::Rand:
    Generater gen;
    for(int i=0;i<size_;i++){
        data_[i]=gen.get_fp32();
    }
        break;
    }
}
void Tensor_fp32::print_2d(){
    if(shape_.size()!=2){
        return;
    }
    std::cout<<"tensor:[";
    for( int i =0;i<shape_[0];i++){
        for(int j=0;j<shape_[1];j++){
            std::cout<< data_[i*shape_[1]+j]<<',';

        }
        std::cout<<std::endl;
    }
    std::cout<<']'<<std::endl;
}
void Tensor_fp32::reshape(const Shape& new_shape){
    size_t new_size=1;
    for(const auto& dimension : new_shape){
        new_size*=dimension;
    }
    
    if(size_!=new_size){
        std::cout<<"size error"<<std::endl;
        return;
    }
    else {
        shape_=new_shape;
        size_=new_size;
    }
}
void Tensor_fp32::transpose(){
    
}
float* Tensor_fp32::get_data(){
    return data_;
}
Shape Tensor_fp32::get_shape(){
    return shape_;
}
Generater::Generater(){
    std::random_device rd;
    std::mt19937 eng_(rd());
};
float Generater::get_fp32(){
    std::uniform_real_distribution<float> float_dist(0.0, 1.0);
    float frac = float_dist(eng_);
    return frac;
}
