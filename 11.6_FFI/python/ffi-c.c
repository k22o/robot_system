#include<stdio.h>
#include<math.h>

void hello(char *str){

  fprintf(stdout, "%s\n",str);
  
}

double sinc(double x){

  return (sin(x)/x);

}
