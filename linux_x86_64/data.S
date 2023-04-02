.section data_bin
.global _data_start
.global _data_end
.global _data_size

.data
.balign 1
_data_start:
.incbin "./data.file"
_data_end:

_data_size = _data_end - _data_start
