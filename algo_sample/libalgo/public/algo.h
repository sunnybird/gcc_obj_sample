#ifndef _ALGO_H_
#define _ALGO_H_

typedef struct algo_hanle_t
{
    void *ctx;
} algo_hanle;

#define KB (1024)
#define MB (1024 * 1024)

int init(algo_hanle **handle);

int deinit(algo_hanle *handle);

#endif