#define N 11

#include "bitwidth_optimizations.h"

void bitwidth_optimizations ( acc_t *y, data_t x){

  coef_t c[N] =  { 53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53 };

  static data_t shiftreg[N];

  acc_t acc;
  ap_int<4> i;
  acc = 0;

  TAPPED_DELAY_LINE:

    for (i = N-1; i> 0; i--) {
        shiftreg[i]  = shiftreg[i-1];
    }
  shiftreg[0]    = x;

  MAC:

    for (i = N-1; i> 0; i--) {
        acc         += shiftreg[i]*c[i];
    }

  acc           += x * c[0];

  *y = acc;
}
