#define N 11

#include "ap_int.h"
#include "unoptimized_fir.h"

void unoptimized_fir ( data_t *y, data_t x){

  coef_t c[N] =  { 53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53 };

  static data_t shiftreg[N];

  acc_t acc;
  int i;
  acc = 0;

  ShiftAccumLoop:

    for (i = N-1; i>= 0; i--){
      if(i == 0)  {
        acc           += x * c[0];
        shiftreg[0]    = x;}
      else  {
        shiftreg[i]  = shiftreg[i-1];
        acc         += shiftreg[i]*c[i];
      }
    }

  *y = acc;
}
