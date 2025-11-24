# CSCA-LabPractical

## CS1CA – ARM Assembly Programming Lab Course

This repository contains lab materials and programs for the ARM Assembly Programming module, covering fundamental concepts through to advanced optimisation techniques.

---

## 📚 Course Overview

### Week 5
**Introduction to Linux and Basic Commands**
- Basic Linux navigation and file operations
- Introduction to the ARM development environment
- Setting up and connecting to the ARM VM
- Basic shell commands and file management

### Week 6
**Reading Week** - No lab activities

### Week 7
**Introduction to C Compilation and ARM Assembly**

**Focus:** Real compilation and ARM assembly fundamentals

**Key Topics:**
- Compiling C programs into executables, object files, and assembly files
- Debugging basic C errors with `-Wall`
- Generating ARM assembly from C using `-O3`
- Writing minimal ARM assembly from scratch
- Understanding ARM registers (`r0-r15`, `fp`, `sp`, `lr`, `pc`)
- Manual linking and multi-file compilation

**Programs:**
- `nothing.c` - Basic return program
- `nm_adder.c` - Simple integer addition
- `bare.s` - Minimal ARM assembly
- `nm_adder2.s` - Compiler-generated assembly
- Multi-file projects (`nm_main.c`, `adder.c`, `adder.h`)

**Key Commands:**
```bash
gcc -Wall -O3 -S nothing.c    # Generate assembly
gcc -Wall -c file.c           # Create object file
as file.s -o file.o           # Assemble to object
file <filename>               # Inspect file type
```

---

### Week 8
**ARM Assembly Debugging, Stack Frames & Function Calls**

**Focus:** Debugging assembly, understanding stack frames, and calling C library functions

**Key Topics:**
- Writing ARM assembly programs that call `printf`
- Understanding stack frame construction
- Using GDB to debug ARM programs
- Inspecting registers and memory during execution
- Accessing command-line arguments in assembly
- Stack pointer (`sp`), frame pointer (`fp`), and link register (`lr`) behaviour

**Programs:**
- `message.s` - Print a message using printf
- `myage.s` - Print integer using format specifiers
- `adder-v0.s` - Print arithmetic expression result
- `adder-v1.s` - Print number of command-line parameters
- `adder-v2.s` - Print parameters and executable name

**Key GDB Commands:**
```bash
gcc -Wall -g program.s -o program
gdb --args program arg1 arg2
break main
run
info registers
p/x $sp
x/4w $sp
next / step
```

**Stack Frame Understanding:**
```asm
mov ip, sp
stmfd sp!, {fp, ip, lr, pc}
sub fp, ip, #4
```

---

### Week 9
**Advanced ARM Assembly & Optimisation**

**Focus:** Complete ARM programs, compiler optimisation, pipelining, and inline assembly

**Key Topics:**
- Converting command-line arguments from ASCII to integers using `atoi`
- Validating input and handling errors
- Control flow and branch hazards
- Compiler optimisation levels (`-O2`, `-O3`)
- Comparing optimised vs unoptimised assembly
- Manual assembly optimisation techniques
- XOR swap trick and register-only computation
- Inline assembly in C programs
- Understanding clobber lists and compiler interaction

**Programs:**
- `adder-v3.s` - Access and print command-line arguments
- `adder-v4.s` - Validate argument count with usage message
- `adder-v5.s` - **Full working adder using `atoi`**
- `main_fib.c`, `ffib.c`, `ffib.h` - Fibonacci optimisation study
- `swap.c` - Traditional and XOR swap implementations
- `inline_asm.c` - Inline assembly examples

**Key Concepts:**
- **Control Hazards:** Branch prediction and pipeline stalls
- **Optimisation:** Tail recursion, register allocation, instruction reduction
- **Stack Management:** Saving/restoring registers across function calls
- **Inline Assembly:** Integrating assembly into C with proper constraints

**Optimisation Workflow:**
```bash
# Compare optimised vs normal compilation
gcc -Wall -O3 main_fib.c ffib.c -o main_fib1
gcc -Wall main_fib.c ffib.c -o main_fib2
time ./main_fib1 35
time ./main_fib2 35

# Generate and compare assembly
gcc -Wall -O3 -S ffib.c -o ffib_optimised.s
gcc -Wall -S ffib.c -o ffib_normal.s
```

---

## 🎯 Core Learning Outcomes

By the end of this course, you will understand:

### **Registers & Memory**
- Purpose of each ARM register (`r0-r15`)
- Stack operations and memory layout
- Register calling conventions

### **Assembly Programming**
- Writing ARM assembly from scratch
- Data movement (`mov`, `ldr`, `str`)
- Arithmetic operations (`add`, `sub`)
- Control flow (`cmp`, `beq`, `b`, `bx lr`)

### **Toolchain & Debugging**
- GCC compilation pipeline
- Object file creation and linking
- Using GDB for assembly debugging
- Inspecting registers and memory

### **Optimisation**
- Compiler optimisation flags
- Analysing generated assembly
- Manual optimisation techniques
- Reducing instruction count and memory access

### **Practical Skills**
- Converting C to assembly and back
- Linking assembly with C programs
- Command-line argument handling
- Stack frame management
- Inline assembly integration

---

## 🛠️ Quick Reference

### Common Compilation Commands

```bash
# Compile C to executable
gcc -Wall program.c -o program

# Generate assembly from C
gcc -Wall -O3 -S program.c

# Compile assembly to executable
gcc -Wall program.s -o program

# Create object file
gcc -Wall -c program.c

# Link object files
gcc file1.o file2.o -o program

# Compile with debug symbols
gcc -Wall -g program.s -o program
```

### ARM Register Reference

| Register | Alias | Purpose |
|----------|-------|---------|
| `r0-r3` | - | Function arguments & return values |
| `r4-r10` | - | Local variables (callee-saved) |
| `r11` | `fp` | Frame pointer |
| `r12` | `ip` | Intra-procedure scratch register |
| `r13` | `sp` | Stack pointer |
| `r14` | `lr` | Link register (return address) |
| `r15` | `pc` | Program counter |

---

## 📂 Repository Structure

```
CSCA-LabPractical/
├── README.md
├── week5/
│   ├── README.md
│   └── nothing.c
├── week6 - Reading Week/
├── week7/
│   ├── README.md
│   ├── nothing.c
│   ├── nm_adder.c
│   ├── nm_main.c
│   ├── adder.c
│   └── adder.h
├── week8/
│   ├── README.md
│   ├── message.s
│   ├── myage.s
│   ├── adder-v0.s
│   ├── adder-v1.s
│   └── adder-v2.s
└── week9/
    ├── README.md
    ├── adder-v3.s
    ├── adder-v4.s
    ├── adder-v5.s
    ├── main_fib.c
    ├── ffib.c
    ├── ffib.h
    ├── swap.c
    └── inline_asm.c
```

---

## 🚀 Getting Started

Each week's folder contains:
- **README.md** - Detailed instructions and explanations
- **Source files** - C and assembly programs for that week's topics

Navigate to each week's folder and follow the README for step-by-step guidance.

---

## 📖 Additional Resources

- **ARM Architecture Reference Manual**
- **GCC Documentation**
- **GDB Debugging Guide**
- **ARM Instruction Set Quick Reference**

---

*This repository documents the complete ARM Assembly Programming lab series for CS1CA.*