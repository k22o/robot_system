#include<stdio.h>
#include<stdlib.h>

int max(int length, int array[]);

int main(){

  int length,ans;
  
  int array[]={1,3,5,9,11,4,2,9,21};
  length = 9;

  ans = max(length,array);
  fprintf(stderr,"%d\n",ans);

}
