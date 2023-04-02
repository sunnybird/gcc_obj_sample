#include "calc_test.h"
#include "calc.h"
#include "data.h"

void out_data_param() {
  printf("data_start : %lu \n", (uint64_t)data_start);
  printf("data_end : %lu \n", (uint64_t)data_end);
  printf("data_size : %lu \n", (uint64_t)&data_size);

  printf("calc data size: \n");
  printf("data size: : %lu \n", data_end - data_start);
}

void test_add() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10, c = 0;
  c = calc_func_add(a, b);
  printf("[%s] (%d , %d) = %d \n", "calc_func_add", a, b, c);
}

void test_sub() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10, c = 0;
  c = calc_func_sub(a, b);
  printf("[%s] (%d , %d) = %d \n", "calc_func_sub", a, b, c);
}

void test_mul() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10, c = 0;
  c = calc_func_mul(a, b);
  printf("[%s] (%d , %d) = %d \n", "calc_func_mul", a, b, c);
}

void test_div() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10, c = 0;
  c = calc_func_div(a, b);
  printf("[%s] (%d , %d) = %d \n", "calc_func_div", a, b, c);
}
