#pragma once

#include "ap_int.h"

typedef ap_int<8>   data_t;
typedef ap_int<10>  coef_t;
typedef ap_int<21>  acc_t;

void bitwidth_optimizations ( acc_t *y, data_t x);
