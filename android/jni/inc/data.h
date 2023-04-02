#ifndef _DATA_H_
#define _DATA_H_
#include "stdint.h"

extern const uint8_t data_start[] __asm("_data_start");
extern const uint8_t data_end[] __asm("_data_end");
extern const uint32_t data_size __asm("_data_size");


#endif
