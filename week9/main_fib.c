#include <stdio.h>
#include <stdlib.h>
#include "ffib.h"

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        return 1;
    }
    
    int n = atoi(argv[1]);
    int result = fib(n);
    
    printf("Fibonacci(%d) = %d\n", n, result);
    
    return 0;
}
