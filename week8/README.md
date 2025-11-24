# Week 8 - ARM Assembly Debugging Lab Instructions

## Purpose

Week 8 builds on Week 7 and focuses on **debugging ARM assembly**, **function calls**, **stack frames**, and **examining registers during program execution**.

You learn:
- How to write ARM assembly programs that call `printf`
- How to pass arguments to C library functions
- How to use GDB to debug ARM programs
- How to understand stack frame construction
- How to access command-line arguments in assembly
- How to inspect registers and memory during execution

---

## What the Instructions Tell You to Do

### 1. Writing a Message-Printing Program (`message.s`)

This program prints:
```
I am programming an ARM in assembly code!
```

**Key concepts:**
- `.asciz` string definitions
- `.align` for memory alignment
- Stack frame setup using `mov`, `stmfd`, `fp`, `ip`, `lr`
- Calling `printf` with `bl printf`
- Restoring caller state with `ldmfd` and `bx lr`

**Compile:**
```bash
gcc -Wall message.s -o message
```

**Run:**
```bash
./message
```

---

### 2. Understanding Core ARM Registers

You must understand the purpose of each register:

| Register | Purpose |
|----------|---------|
| `r0–r3` | Function arguments & return values |
| `r4–r10` | Local variables |
| `r11` (fp) | Frame pointer |
| `r12` (ip) | Scratch register |
| `r13` (sp) | Stack pointer |
| `r14` (lr) | Return address |
| `r15` (pc) | Program counter (next instruction) |

---

### 3. Analysing Stack Frame Construction

Study how the stack frame is built:

```asm
mov ip, sp
stmfd sp!, {fp, ip, lr, pc}
sub fp, ip, #4
```

**You will examine:**
- Memory layout before and after `stmfd`
- Why `FP = IP − 4`
- Where arguments and return addresses are stored

---

### 4. Using GDB to Debug ARM Programs

Learn how to debug with GDB:

**Compile with debug symbols:**
```bash
gcc -Wall -g message.s -o message
```

**Start GDB:**
```bash
gdb message
```

**Common GDB commands:**
- `break message.s:8` — Set breakpoint at line 8
- `run` — Start program execution
- `info registers` — Inspect all registers
- `p/x $sp` — Print stack pointer in hex
- `p/x $fp` — Print frame pointer in hex
- `next` — Step to next instruction
- `step` — Step into function calls
- `x/4w $sp` — Examine 4 words at stack pointer

---

### 5. Passing Integers to printf (`myage.s`)

Modify the message program to print your age:

```
I am 20 years old
```

**Key concepts:**
- String with `%d` format specifier
- Passing constants through registers:
  - `r0` → format string address
  - `r1` → integer argument

**Compile and run:**
```bash
gcc -Wall myage.s -o myage
./myage
```

---

### 6. Printing Expressions (`adder-v0.s`)

Create a program that prints:
```
2 + 3 = 5
```

**Implementation:**
- Store constants in `r1`, `r2`
- Calculate result in `r3`
- Pass all to `printf`

**Compile and run:**
```bash
gcc -Wall adder-v0.s -o adder-v0
./adder-v0
```

---

### 7. Reading Command-Line Arguments

Use GDB to inspect arguments passed from the shell:

- `r0` stores number of parameters (argc)
- `r1` points to the argument list (argv)

**Debug with arguments:**
```bash
gdb --args adder-v1 10 20
```

---

### 8. Printing the Number of Parameters (`adder-v1.s`)

A program that prints:
```
You have passed 3 parameters
```

**Key concept:**
- `r0` contains the argument count
- The executable name counts as the first argument

**Compile and run:**
```bash
gcc -Wall adder-v1.s -o adder-v1
./adder-v1 10 20
```

---

### 9. Printing the Executable Name (`adder-v2.s`)

Learn how to retrieve the program name:

```asm
ldr r2, [r1]
```

And pass it to `printf` using `%s`.

**Output example:**
```
You have passed 3 parameters to ./adder-v2
```

**Compile and run:**
```bash
gcc -Wall adder-v2.s -o adder-v2
./adder-v2 10 20
```

---

### 10. Exploring Remaining Arguments

Using GDB:
- Inspect `r1`, `r1+4`, `r1+8` to see pointers to `argv[]`
- Dereference strings using `x/2b *($r1+4)`

This shows you how command-line arguments are stored in memory.

---

### Self-Assessment Task

Before leaving the lab, produce:

**A table of register contents** (`PC`, `LR`, `SP`, `IP`, `FP`) at each step of execution of `adder-v2.s`

You must:
1. Use GDB to step through the program
2. Observe stack frame behaviour
3. Record register and memory changes

**Example workflow:**
```bash
gcc -Wall -g adder-v2.s -o adder-v2
gdb --args adder-v2 10 20
(gdb) break main
(gdb) run
(gdb) info registers
(gdb) next
(gdb) info registers
# ... repeat and document
```

---

## In Short

Week 8 teaches you:

**Assembly → GDB → Stack Frames → printf → Command-line Arguments**

And introduces you to:
- ✅ Writing ARM assembly programs with function calls
- ✅ Using GDB for debugging assembly
- ✅ Understanding stack frame construction
- ✅ Passing arguments to C library functions
- ✅ Accessing command-line arguments in assembly
- ✅ Inspecting registers and memory during execution

> **This week is essential for understanding how programs interact with the operating system and how function calls work at the assembly level.**
