#include <stdio.h>
#include <stdlib.h>

void* ext_malloc( int size ) {

    printf( "[%s] and size: %d \n", __FUNCTION__, size );
    return malloc( size );
}
void ext_free( void* ptr ) {
    printf( "[%s] and ptr: %p \n", __FUNCTION__, ptr );
    free( ptr );
}