#include <stdio.h>

int main(){
    int a, b, c, i, sum;
    a = 0;
    b = 10;
    c = 2;
    sum = 0;

    for (i = a; i < b; i+=c){
        sum += i;
    }

    printf("%d", sum);

    return 0;
}