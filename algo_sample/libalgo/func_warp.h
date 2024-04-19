
#ifndef _FUNC_WARP_H_
#define _FUNC_WARP_H_

#include <stdlib.h>

void* __wrap_malloc(int size);
void __wrap_free(void* ptr);

// void* __real_malloc( int size );
// void  __real_free( void* ptr );

void* ext_malloc(int size);
void ext_free(void* ptr);

#endif