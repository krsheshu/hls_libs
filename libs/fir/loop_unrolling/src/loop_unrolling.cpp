#define N 11

#include "ap_int.h"
#include "loop_unrolling.h"

//#pragma HLS array_partition variable=shiftreg complete

void loop_unrolling ( data_t *y, data_t x){

  coef_t c[N] =  { 53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53 };

  static data_t shiftreg[N];

  acc_t acc;
  int i;
  acc = 0;


  TAPPED_DELAY_LINE:

    for (i = N-1; i> 0; i-=1) {
        #pragma HLS unroll //factor = 4
        shiftreg[i]  = shiftreg[i-1];
    }
  shiftreg[0]    = x;

  MAC:

    for (i = N-1; i> 0; i-=1) {
        #pragma HLS unroll //factor = 4
        acc         += shiftreg[i]*c[i];
    }

  acc           += x * c[0];

  // Manual Unroll factor = 2
  //TAPPED_DELAY_LINE:

  //  for (i = N-1; i> 0; i-=2) {
  //      shiftreg[i]  = shiftreg[i-1];
  //      shiftreg[i-1]  = shiftreg[i-2];
  //  }
  //shiftreg[1]    = shiftreg[0];
  //shiftreg[0]    = x;

  //MAC:

  //  for (i = N-1; i> 0; i-=2) {
  //      acc         += shiftreg[i]*c[i] + shiftreg[i-1]*c[i-1] ;
  //  }

  //acc           += x * c[0];

  *y = acc;
}
