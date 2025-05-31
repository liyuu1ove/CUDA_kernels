#pragma once

#include <iostream>
#include <vector>
#include <random>

using Shape=std::vector<int>;

class Generater{
public:
    Generater();
    Generater(const Generater &)=delete;
    Generater& operator=(const Generater& )=delete;
    float get_fp32();
private:
    std::mt19937 eng_;

};//TO DO: make it a singleton

class Tensor_fp32{
public:
    enum class Initializer: unsigned char{
        Zero,
        One,
        Rand
    };
    explicit Tensor_fp32(const Shape& shape,Tensor_fp32::Initializer Init);
    void print_2d();
    void reshape(const Shape& new_shape);
    void transpose();
    float* get_data();
    Shape get_shape();
private:
    enum class Type: unsigned char{
        Int16,
        Int8,
        Float,
        Double
    };
    
    Shape shape_;
    float* data_;
    size_t size_;

    //Type type_;
};