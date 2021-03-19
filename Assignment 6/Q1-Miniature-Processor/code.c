#include <stdio.h>

int main()
{
    short a, b, c, d;
    a = 17;
    printf("%h", a); b = -9; 
    printf("%h %h", a, b); c = 65; 
    printf("%h %h", b, c);
    d = 8*c - 512*(a + b);
    printf("%h", d);
    return 0;
}