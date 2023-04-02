#include "calc_test.h"
#include "calc.h"
#include "data.h"

void out_data_param() {
  printf("data_start : %lu \n", data_start);
  printf("data_end : %lu \n", data_end);
  printf("data_size : %lu \n", &data_size);

  printf("calc data size: \n");
  printf("data size: : %lu \n", data_end - data_start);
}

void test_add() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10;
  printf("[%s] (%d , %d) = %d \n", "calc_func_add", a, b, calc_func_add(a, b));
}

void test_sub() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10;
  printf("[%s] (%d , %d) = %d \n", "calc_func_sub", a, b, calc_func_sub(a, b));
}

void test_mul() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10;
  printf("[%s] (%d , %d) = %d \n", "calc_func_mul", a, b, calc_func_mul(a, b));
}

void test_div() {
  printf("[%s]", __FUNCTION__);
  int a = 100, b = 10;
  printf("[%s] (%d , %d) = %d \n", "calc_func_div", a, b, calc_func_div(a, b));
}