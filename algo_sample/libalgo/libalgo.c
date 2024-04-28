#include "algo.h"
#include <stdio.h>
#include <stdlib.h>

#include "runtime.h"

int init( algo_hanle** handle ) {

    *handle          = malloc( sizeof( algo_hanle ) );
    ( *handle )->ctx = malloc( 10 * MB );

    init_rt();
    run_rt();
    return 0;
};

int deinit( algo_hanle* handle ) {

    deinit_rt();
    if ( handle ) {
        free( handle->ctx );
        free( handle );
        handle = NULL;
    }

    return 0;
}