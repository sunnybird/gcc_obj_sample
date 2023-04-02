#ifndef _DATA_H_
#define _DATA_H_
#include "stdint.h"

extern const uint8_t data_start[] asm("_data_start");
extern const uint8_t data_end[] asm("_data_end");
extern const uint32_t data_size asm("_data_size");


#endif