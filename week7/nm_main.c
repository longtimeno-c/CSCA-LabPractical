#include <stdio.h>
#include <stdlib.h>
#include "adder.h"

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <num1> <num2>\n", argv[0]);
        return 1;
    }
    
    int n = atoi(argv[1]);
    int m = atoi(argv[2]);
    int result = add(n, m);
    
    printf("%d + %d = %d\n", n, m, result);
    
    return 0;
}
