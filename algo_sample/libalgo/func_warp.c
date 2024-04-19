#include "func_warp.h"

#include "stdio.h"

void* __wrap_malloc( int bytes ) {
    printf( "[%s] and bytes: %d \n", __FUNCTION__, bytes );
    return ext_malloc( bytes );
}

void __wrap_free( void* ptr ) {
    printf( "[%s] and ptr: %p \n", __FUNCTION__, ptr );
    ext_free( ptr );
}