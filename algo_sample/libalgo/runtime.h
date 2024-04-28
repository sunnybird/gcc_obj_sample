#ifndef _RUNTIME_H_
#define _RUNTIME_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct rt_hanle_t {
    void* ctx;
} rt_hanle;

static rt_hanle g_rt_hanle;

int init_rt();

int deinit_rt();

int run_rt();

#ifdef __cplusplus
}
#endif

#endif