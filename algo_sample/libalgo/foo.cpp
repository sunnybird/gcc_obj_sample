#include "foo.hpp"
#include "stdio.h"

foo::foo(/* args */)
{
}

foo::~foo()
{
}

void foo::bar()
{
    // std::cout << "foo::bar()" << std::endl;
    printf("foo::bar() \n");
}