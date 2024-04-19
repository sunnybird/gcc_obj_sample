#include <stdio.h>

#include "algo.h"

int main( int n, char** args ) {
    printf( "Hello, from algomain!\n" );

    algo_hanle* algo;

    init( &algo );

    deinit( algo );
}
