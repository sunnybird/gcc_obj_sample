#include "algo.h"
#include <stdio.h>
#include <stdlib.h>

int init( algo_hanle** handle ) {

    *handle          = malloc( sizeof( algo_hanle ) );
    ( *handle )->ctx = malloc( 10 * MB );

    return 0;
};

int deinit( algo_hanle* handle ) {

    if ( handle ) {
        free( handle->ctx );
        free( handle );
        handle = NULL;
    }

    return 0;
}