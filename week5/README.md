# Week 5 - ARM/QEMU Lab Instructions

## Purpose

This lab introduces you to using **QEMU** — a virtual ARM-based Linux system — to prepare for writing, compiling, and analysing ARM assembly and C programs in later labs.

---

## What the Instructions Tell You to Do

### 1. Understand the Goal of Week 5

Week 5 is about getting used to the ARM simulator, **not** doing ARM assembly yet.

You learn:
- How to launch the ARM QEMU simulator
- How to log in
- How to edit and save C files using `vim`
- How to move files in/out using WinSCP
- How to safely shut down the simulator

> **Note:** Later weeks (7–9) use this environment for actual ARM programming.

---

### 2. Launch QEMU (the ARM simulator)

The document walks you through:
1. Opening **AppsAnywhere**
2. Searching for **QEMU**
3. Launching it

You will see **two windows**:
- **A command window** (DO NOT close it) — it runs the emulator
- **The ARM Linux terminal window** — which boots like a real computer

---

### 3. Control the Mouse Inside/Outside QEMU

- Inside QEMU, the mouse disappears
- **Click inside window** → mouse captured
- **Press `Ctrl + Alt`** → release mouse

Practice this to avoid confusion.

---

### 4. Log into the ARM System

Use:
```
username: arm
password: ee2a2
```

You then get a Linux shell prompt.

To log out:
```bash
exit
```

---

### 5. Create and Edit a C Program Using vim

Create a file:
```bash
vim nothing.c
```

**Steps:**
1. Press `i` to enter insert mode
2. Type this exact program:
   ```c
   int main() {
       return 0;
   }
   ```
3. Press `Esc`
4. Type `:x` to save and quit

**Confirm file exists:**
```bash
ls
cat nothing.c
```

---

### 6. Move Files In/Out Using WinSCP

Because the ARM simulator is temporary, your files can be deleted when you exit.  
You **must** download them using **WinSCP**.

**Connection details:**
```
Host:     localhost
Port:     2222
User:     arm
Password: ee2a2
```

You can then upload/download between:
- The ARM VM
- Your local machine
- OneDrive

---

### 7. Safely Shut Down the Simulator

To avoid crashing Windows or QEMU:

**Correct safe sequence:**
1. Hold `Del` first
2. Then press `Ctrl + Alt` while holding `Del`

This triggers shutdown inside the simulator.

---

### 8. Optional Practice (if you finish early)

#### Compile the C file
```bash
gcc -Wall nothing.c -o nothing
```

Run:
```bash
./nothing
```
(The program prints nothing.)

#### Generate ARM Assembly from the C file
```bash
gcc -Wall -S nothing.c
```

This creates: `nothing.s`

View contents:
```bash
cat nothing.s
```

This prepares you for analysing ARM instructions in weeks 7–9.

---

## In Short

The file tells you to:
1. ✅ Start QEMU
2. ✅ Log into ARM Linux
3. ✅ Learn to move in/out of the VM
4. ✅ Create a simple C program using `vim`
5. ✅ Transfer files using WinSCP
6. ✅ Shut down the emulator properly
7. ✅ Optionally compile and view assembly output

> **This lab is purely about setup + environment familiarisation before real ARM work begins.**
