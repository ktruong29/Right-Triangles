/**************************************
Author:        Kien Truong
Program name:  Assignment 5
Course ID:     CPSC 240
***************************************/

#include <stdio.h>
double hypo_triangle();

int main()
{
  double return_code = -99.0;

  printf("%s", "Welcome to CPSC 240 brought to you by Kien Truong\n\n");

  return_code = hypo_triangle();

  printf("%s%5.6lf%s", "This main program has received this number ", return_code,
         ". Have a nice day.\nMain will return 0 to the operating system.");

  return 0;
}
