# Week 7 - ARM Assembly Lab Instructions

## Purpose

Week 7 is where you actually begin **real compilation** and **real ARM assembly writing**.

You learn:
- How to compile C programs into executables, object files, and assembly files
- How to debug basic C errors
- How to generate assembly from C
- How to write minimal ARM assembly from scratch
- How to understand key ARM registers
- How to link files manually

---

## What the Instructions Tell You to Do

### 1. Learn a Few New Linux Commands

The lab introduces three useful commands (page 1):

- `mv` — rename a file
- `rm` — remove files
- `cp` — copy files

These are needed later when you start duplicating `.s` templates and renaming things.

---

### 2. Task 1: Compile and Run C Programs

This section begins the real hands-on work.

#### Upload `nothing.c` from last week

You use **WinSCP** to upload it into the ARM VM.

**Compile it:**
```bash
gcc -Wall nothing.c -o nothing
```

- `-Wall` enables warnings
- `-o` sets the executable name

**Run it:**
```bash
./nothing
```

**Check its exit code:**
```bash
echo $?
```

You should see `0`, because the program returns `0`.

---

### 3. Work with a More Useful C Program (`nm_adder.c`)

You create this via `vim`. The program:
- Defines two integers `n = 3` and `m = 4`
- Adds them
- Prints the result

**Compile:**
```bash
gcc -Wall nm_adder.c -o nm_adder
```

**Run:**
```bash
./nm_adder
```

**Output:**
```
3 + 4 = 7
```

---

### 4. Explore Errors and Warnings

The document teaches you what happens when types mismatch.

**Example mistake:**
```c
float result = n + m;
```

Compiling with `-Wall` produces a warning.  
Running it prints wrong results (`0`) because of mismatched printing formats.

**Lesson:**  
Types matter and warnings matter.

---

### 5. Create & Use Object Files

Object files (`.o`) are intermediate machine code.

**Generate object file:**
```bash
gcc -Wall -c nm_adder.c
```

You get: `nm_adder.o` — not executable by itself.

**Link object file into an executable:**
```bash
gcc nm_adder.o -o my_nmadder
```

**Run:**
```bash
./my_nmadder
```

---

### 6. Generate ARM Assembly From C

This is the **heart of Week 7**.

**Use:**
```bash
gcc -Wall -O3 -S nothing.c
```

**Produces:** `nothing.s`

The file contains ARM assembly code.  
The document shows an example on page 6.

**You can view it:**
```bash
cat nothing.s
```

---

### 7. Assemble `.s` Files Into `.o`

Using the assembler directly:
```bash
as nothing.s -o nothing.o
```

This converts assembly into object code.

---

### 8. Inspect File Types

The `file` command gives you details:
```bash
file nothing
file nothing.o
file nothing.s
file nothing.c
```

**Examples:**
- **Executable:** `ELF 32-bit ARM`
- **Object file:** `ELF 32-bit relocatable`
- **Assembly:** `ASCII assembler source`
- **C file:** `ASCII C program text`

---

### 9. Begin Writing Your Own ARM Assembly

This is where you strip down `nothing.s` into a minimal file.

They suggest creating **`bare.s`:**
```asm
.text
.global main
main:
    mov r0, #0
    bx lr
```

**Compile it:**
```bash
gcc -Wall bare.s -o bare
```

**Run & check:**
```bash
./bare
echo $?
```

Exit code = `0`.

**Modify it:**  
Change:
```asm
mov r0, #0
```
to:
```asm
mov r0, #3
```

Exit code should become `3`.

---

### 10. Try Simple Arithmetic in Assembly

Add these lines:
```asm
mov r1, #3
mov r2, #4
add r0, r1, r2
bx lr
```

Exit code should be `7`.

This teaches you basic ARM instructions.

---

### 11. Use the ARM Assembly "Template"

They give you a reusable skeleton:
```asm
.text
.global main
main:
    @ your code here
    mov r0, #0
    bx lr
```

You use this for later tasks.

---

### 12. Examine Compiler-Generated Assembly (`nm_adder2.s`)

The file (shown on page 9) includes:
- Stack setup
- Function prologue
- Loading constants
- Calling `printf`
- Function epilogue

This is a big example showing what **real compiler output** looks like.

It explains each part:
- Labels
- `.ascii`
- `.align`
- `.text`
- Register moves
- Loads/stores
- `bl printf`
- Restoring the stack

**You then compile it:**
```bash
gcc -Wall nm_adder2.s -o nm_adder2
./nm_adder2
```

---

### 13. Learn ARM Registers (page 11)

The document lists the **16 core registers:**

| Register | Purpose |
|----------|---------|
| `r0–r3` | Function arguments & return values |
| `r4–r10` | Local variables |
| `r11` (fp) | Frame pointer |
| `r12` (ip) | Scratch register |
| `r13` (sp) | Stack pointer |
| `r14` (lr) | Return address |
| `r15` (pc) | Program counter |

You need this knowledge for **Week 8**.

---

### 14. Additional Tasks: Multi-File C Compilation

You split code into:
- `nm_main.c`
- `adder.c`
- `adder.h`

**Then compile all together:**
```bash
gcc -Wall nm_main.c adder.c -o new_nmadder
```

**Then run it with arguments:**
```bash
./new_nmadder 7 8
```

---

### 15. Independent Compilation Workflow

**Compile each file separately:**
```bash
gcc -Wall -c nm_main.c
gcc -Wall -c adder.c
```

**Then link:**
```bash
gcc nm_main.o adder.o -o my_nmadder
```

This demonstrates why splitting code matters in real projects.

---

### 16. Self-Assessed Coursework

You must:
- Compile with `-O3`
- Compile without `-O3`
- Compare the two `.s` files
- Examine how `printf` is handled
- Use the instruction summary (pages 16–17)

---

## In Short

Week 7 teaches you:

**C → Object → Executable → Assembly → Object → Executable**

And introduces you to:
- ✅ Using GCC for compilation
- ✅ Generating ARM assembly
- ✅ Writing your own ARM assembly
- ✅ Linking multi-file projects
- ✅ Understanding registers & calling conventions

> **This week is the foundation for writing real ARM programs in later labs.**
