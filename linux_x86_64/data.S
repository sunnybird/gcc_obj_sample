#define STR1(R)  #R
#define STR2(R)  STR1(R)

.section data_bin
.global _data_start
.global _data_end
.global _data_size

.data
.balign 1
_data_start:
#ifdef DATA_FILE_PATH
.incbin STR2(DATA_FILE_PATH)
#else
.incbin "./data.file"
#endif
_data_end:

_data_size = _data_end - _data_start
