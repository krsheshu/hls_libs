
#ifndef UNOPTIMIZED_FIR
#define UNOPTIMIZED_FIR

typedef int data_t;
typedef int coef_t;
typedef int  acc_t;

void loop_unrolling ( data_t *y, data_t x);

#endif