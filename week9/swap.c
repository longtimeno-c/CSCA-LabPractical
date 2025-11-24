#include <stdio.h>

void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}

void xor_swap(int *x, int *y) {
    if (x != y) {
        *x ^= *y;
        *y ^= *x;
        *x ^= *y;
    }
}

int main(void) {
    int a = 5;
    int b = 10;
    
    printf("Before swap: a = %d, b = %d\n", a, b);
    swap(&a, &b);
    printf("After swap: a = %d, b = %d\n", a, b);
    
    printf("\nBefore xor_swap: a = %d, b = %d\n", a, b);
    xor_swap(&a, &b);
    printf("After xor_swap: a = %d, b = %d\n", a, b);
    
    return 0;
}
