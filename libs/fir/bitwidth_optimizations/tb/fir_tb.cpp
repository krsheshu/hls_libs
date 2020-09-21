#define N 11

#include <iostream>
#include "../src/bitwidth_optimizations.h"

#define RET_SUCCESS 0
#define RET_FAILURE 1

int main () {


	data_t x[N] =  {  1, 2,   3, 4,   5,   6,   7, 8,   9, 10, 11 };
	coef_t c[N] =  { 53, 0, -91, 0, 313, 500, 313, 0, -91,  0, 53 };
	acc_t  y = 0;
	acc_t  rtlOut = 0;

	std::cout<<"Simulation Starting\n";
	for (int i = 0; i < N; i++ ) {
		y +=  x[i]* c[i];
		bitwidth_optimizations ( &rtlOut, x[i] );
	}

	if ( rtlOut != y )	{
		std::cout<<"Simulation Failed. rtlOut: "<< rtlOut <<" y: " << y <<std::endl;
		return RET_FAILURE;
	}
	else	{
		std::cout<<"Simulation Successful. rtlOut: "<< rtlOut <<" y: " << y;
	}

	return RET_SUCCESS;
}
