#include <stdio.h>
#include <stdlib.h>

void* ext_malloc( int size ) {
    void* ptr = malloc( size );
    printf( "[%s] and size: %d and ptr: %p\n", __FUNCTION__, size, ptr );
    return ptr;
}
void ext_free( void* ptr ) {
    printf( "[%s] and ptr: %p \n", __FUNCTION__, ptr );
    free( ptr );
}