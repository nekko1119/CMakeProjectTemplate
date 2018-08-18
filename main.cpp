#include "calc.h"
#include <iostream>

int main() {
#ifdef _MSC_VER
    std::cout << "this is msvc compiler" << std::endl;
#elif defined(__GNUC__)
    std::cout << "this is g++ compiler" << std::endl;
#else
    std::cout << "this is other compiler" << std::endl;
#endif
    std::cout << add(40, 2) << std::endl;
}
