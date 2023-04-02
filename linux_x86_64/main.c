#include "calc_test.h"
#include "stdio.h"

int main(int argc, char const *argv[]) {
  printf("========RUN TYPE : %s ========== \n", TAG_TYPE);
  printf("%s start \n", __FUNCTION__);
  test_add();
  test_sub();
  test_mul();
  test_div();

  out_data_param();
  printf("%s end \n", __FUNCTION__);
  return 0;
}
