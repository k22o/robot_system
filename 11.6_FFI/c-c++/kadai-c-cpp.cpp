#include <math.h>

extern "C"{
  int max(int length, int array[]){
    int max_value = 0;

    for(int i=0;i<length;i++){
      if(array[i]>max_value) max_value = array[i];
    }

    return max_value;
  }
}
