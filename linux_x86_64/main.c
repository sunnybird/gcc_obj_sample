#include "calc_test.h"
#include "stdio.h"
#define STR1(R)  #R
#define STR2(R)  STR1(R)

int main(int argc, char const *argv[]) {

#ifdef TAG_TYPE
  printf("========RUN TYPE : %s ========== \n", STR2(TAG_TYPE));
#else
  printf("========RUN TYPE : %s ========== \n", "default");
#endif

  printf("%s start \n", __FUNCTION__);
  test_add();
  test_sub();
  test_mul();
  test_div();

  out_data_param();
  printf("%s end \n", __FUNCTION__);
  return 0;
}
