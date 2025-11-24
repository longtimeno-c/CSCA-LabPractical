#include <stdio.h>

int main(void) {
    int PC_val;
    
    // Inline assembly to read program counter
    asm("mov %0, pc" : "=r"(PC_val));
    
    printf("Program Counter value: 0x%x\n", PC_val);
    
    int a = 5, b = 10;
    printf("Before inline swap: a = %d, b = %d\n", a, b);
    
    // Inline assembly for register operations
    asm volatile(
        "eor %0, %0, %1\n\t"
        "eor %1, %0, %1\n\t"
        "eor %0, %0, %1\n\t"
        : "+r"(a), "+r"(b)
    );
    
    printf("After inline swap: a = %d, b = %d\n", a, b);
    
    return 0;
}
