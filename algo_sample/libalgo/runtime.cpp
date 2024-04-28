#include "runtime.h"
#include "foo.hpp"

int init_rt()
{
    g_rt_hanle.ctx = new foo();

    return 0;
}

int deinit_rt()
{
    if (g_rt_hanle.ctx != nullptr)
    {
        delete (foo *)g_rt_hanle.ctx;
    }
    return 0;
}

int run_rt()
{
    if (g_rt_hanle.ctx != nullptr)
    {
        ((foo *)g_rt_hanle.ctx)->bar();
    }
    return 0;
}