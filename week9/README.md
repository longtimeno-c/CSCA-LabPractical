# Week 9 - ARM Assembly Advanced Programming & Optimisation

## Purpose

Week 9 continues from Weeks 7 and 8, going deeper into:
- How ARM assembly handles command-line arguments
- How parameters move through registers and memory
- How to use `atoi`, `printf`, and the stack safely
- How to detect wrong argument counts
- How to finish a full ARM assembly "adder" program
- How to work with compiler optimisation (`-O2`, `-O3`)
- How to examine pipelining hazards
- How to rewrite and optimise Fibonacci and swap routines
- Introduction to inline assembly

**This is the final practical for ARM assembly.**

---

## What the Instructions Tell You to Do

### 1. Start by Recapping Argument Passing

You continue from Week 8's `adder-v2.s`, which printed:
- Number of parameters
- Name of the executable

Now in Week 9, you complete the job:
- Read actual arguments (two integers)
- Convert them from ASCII
- Perform the addition
- Print the results

---

### 2. Program: `adder-v3.s` — Print Arguments Passed

This version teaches you how to access `argv[]` manually in ARM assembly.

**Key ideas:**
- `r0` holds `argc`
- `r1` holds the pointer to `argv` (array of pointers)
- `[r1, #4]` → `argv[1]`
- `[r1, #8]` → `argv[2]`

**Compile and run:**
```bash
gcc -Wall adder-v3.s -o adder-v3
./adder-v3 5 9
```

**Output:**
```
3 parameters. 1st arg: 5, 2nd arg: 9
```

**Note:** No validation yet.

---

### 3. Program: `adder-v4.s` — Validate Argument Count

This version adds a usage message and control-flow branching.

**If `argc != 3`, print:**
```
Usage: ./adder-v4 n m (with n and m integers)
```

**Key instruction:**
```asm
cmp r0, #3
beq CONT
```

- If equal → run normal code
- If not equal → print usage string

**Important concept: Control Hazard**

After `cmp` and `beq`, a pipelined ARM processor might have partially fetched the next instruction before the branch resolves.

**You are asked to identify where this hazard is in `adder-v4.s`.**

**Compile and test:**
```bash
gcc -Wall adder-v4.s -o adder-v4
./adder-v4
./adder-v4 5 9
```

---

### 4. Program: `adder-v5.s` — Full Working Addition

This is the **final, fully working ARM assembly program**.

**It does:**
1. Validates argument count
2. Saves registers on the stack
3. Extracts `argv[1]` & `argv[2]`
4. Converts them from ASCII → integer using `atoi`
5. Restores registers from the stack
6. Computes: `r3 = r1 + r2`
7. Calls `printf` to print: `<a> + <b> = <sum>`

**How the stack is used:**
1. Push `r1` (argv pointer)
2. Call `atoi`
3. Pop `r1` back
4. Push `r2`
5. Call `atoi` again
6. Pop `r2` back

**Compile and run:**
```bash
gcc -Wall adder-v5.s -o adder-v5
./adder-v5 7 8
```

**Output:**
```
7 + 8 = 15
```

---

### 5. Debugging Practice with GDB

You are encouraged to:
```bash
gcc -Wall -g adder-v4.s -o adder-v4
gdb ./adder-v4
```

Step through execution and watch how `beq` works internally.

**Useful GDB commands:**
- `break main`
- `run 5 9`
- `info registers`
- `next`
- `step`
- `x/4w $sp`

---

### 6. Compiler Optimisation: Fibonacci Example

The second half of Week 9 is about **optimisation and manual tuning**.

You study the C Fibonacci program and explore how compiler levels change the assembly.

**Files:**
- `main_fib.c`
- `ffib.c`
- `ffib.h`

**Compile with and without optimisation:**
```bash
gcc -Wall -O3 main_fib.c ffib.c -o main_fib1
gcc -Wall main_fib.c ffib.c -o main_fib2
```

**Run with timing:**
```bash
time ./main_fib1 35
time ./main_fib2 35
```

The optimised one should be **roughly twice as fast**.

**You then:**
1. Generate `.s` files with and without `-O3`
2. Compare them line-by-line
3. Identify where branching and recursion are improved
4. Observe how the compiler reduces overhead (tail recursion, register usage, etc)

---

### 7. Manual Assembly Optimisation Exercises

**Copy and generate assembly:**
```bash
cp ffib.c ffib3.c
cp ffib.c ffib4.c
gcc -Wall -O3 -S ffib3.c
gcc -Wall -S ffib4.c
```

**You now have:**
- `ffib3.s` (optimised)
- `ffib4.s` (normal)

**Then produce executables:**
```bash
gcc main_fib.c ffib3.s -o main_fib3
gcc main_fib.c ffib4.s -o main_fib4
```

**Test both with time:**
```bash
time ./main_fib3 35
time ./main_fib4 35
```

**Compare the structure and identify why one is faster.**

---

### 8. Optional Task: Swap Function Optimisation

The classic **XOR-swap trick:**
```c
*x ^= *y;
*y ^= *x;
*x ^= *y;
```

**You are challenged to:**
1. Write a swap function
2. Inspect compiler-generated assembly
3. Manually optimise it to reduce memory loads/stores
4. Show that the whole swap can be done in ~8 lines of assembly
5. Realise that assembly can achieve swaps even faster

**This is training for:**
- Instruction reduction
- Register-only computation
- Eliminating unnecessary memory accesses

---

### 9. Introduction to Inline Assembly

You learn:
- How to insert single-line and multi-line assembly inside C
- How to pass registers and variables into/out of inline assembly
- How clobber lists work
- Why careless inline assembly can break the stack or crash the program

**Examples include:**
```c
asm("xor r0, r1, r2");
```

**And:**
```c
asm("mov %0, pc" : "=r"(PC_val));
```

**The point:**  
The compiler doesn't know what your assembly does unless you tell it through inputs/outputs/clobbers.

---

## Overall Learning Outcomes (Week 9)

Across Weeks 7-9, you now know:

### Registers & Memory
- `r0–r3` → parameters & return values
- `r4–r10` → local variables
- `r11` (fp), `r12` (ip), `r13` (sp), `r14` (lr), `r15` (pc)
- How the stack grows/shrinks
- How values move between registers & memory

### Data Manipulation in ARM
- `mov`, `add`, `sub`, `ldr`, `str`
- `bx lr` return behaviour
- Passing arguments to functions
- Calling library routines (`printf`, `atoi`)

### Control Flow
- `cmp`, `beq`, `b`
- How control hazards arise in pipelines
- Why branch prediction matters

### Optimisation
- Compiler optimisation flags (`-O2`, `-O3`)
- Examining generated assembly
- Analysing recursive overhead
- Reducing instruction count
- Eliminating unnecessary loads/stores

### Practical Program Construction
- Writing full ARM programs from scratch
- Converting C → assembly → executable
- Linking assembly with C
- Debugging with GDB
- Working with real command-line arguments

---

## In Short

Week 9 is about taking everything you've learned and finishing a **real, fully functional ARM program**, then moving into **optimisation, pipelining, and inline assembly** — the advanced topics that make real low-level programming work.

> **This is the culmination of your ARM assembly programming journey.**
