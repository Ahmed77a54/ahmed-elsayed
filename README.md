### System Requirements

You'll need the following installed:
- **GNU C Compiler (GCC)**: For compiling C source code
- **Unix-like OS**: Linux or macOS (uses POSIX system calls)

Installing GCC on Debian-based systems:
```bash
sudo apt install build-essential
```

### Setup Instructions

1. Get the code:
```bash
git clone https://github.com/Homd11/assignment2.git
cd assignment2
```

2. Build everything:
```bash
make all
```

## How to Use

### Build all executables
```bash
make all
```

### Execute all demonstrations
```bash
make run
```

### Remove compiled binaries
```bash
make clean
```

### Build specific programs
```bash
# Fork demonstration
make process_creation

# Linking demonstration
make linked_program

# Loader demonstration
make simple_program
```

## Program Demonstrations

### Demo 1: Fork-Based Process Creation

**Source File:** `process_creation.c`

Demonstrates creating a duplicate process using the POSIX `fork()` system call.

**Key Concepts:**
- Duplicates the current process into parent and child
- Both processes execute concurrently
- Each process has a unique Process ID
- Return value determines which process is executing

**Execute:**
```bash
./process_creation
```

**Sample Output:**
```
Parent Process Running | Process ID: [parent_pid]
Child Process Running | Process ID: [child_pid]
```

### Demo 2: Multi-File Linking Example

**Source Files:** `file1.c`, `file2.c`

Illustrates how separate compilation units are linked together.

**Program Structure:**
- `file1.c` implements the `display_greeting()` function
- `file2.c` declares and invokes `display_greeting()` from main
- The linker resolves the function reference between files

**Execute:**
```bash
./linked_program
```

**Sample Output:**
```
Greetings from the first module!
```

### Demo 3: Dynamic Library Loading

**Source File:** `simple_program.c`

Minimal program for examining loader behavior and library dependencies.

**Purpose:**
- Shows basic program structure
- Used with `ldd` to inspect dynamically loaded libraries

**Execute:**
```bash
./simple_program
ldd simple_program
```

**Sample Output:**
```
Basic program executing successfully.
```

Running `ldd` reveals which shared libraries the loader maps into memory.

## Compilation Toolchain Concepts

### Linker Overview

The **linker** merges compiled object files into a unified executable program.

**Primary Functions:**
1. **Cross-Reference Resolution**: Connects function calls across different compilation units
2. **Address Assignment**: Determines final memory locations for code and data
3. **Library Integration**: Incorporates external library code (static or dynamic)
4. **Validation**: Detects missing or conflicting symbol definitions

**Practical Example:** When `file1.c` and `file2.c` are compiled separately, the linker merges their object files and resolves the `display_greeting()` function call.

### Loader Overview

The **loader** is an OS component responsible for preparing executables for runtime.

**Primary Functions:**
1. **Memory Allocation**: Reads executable from disk and allocates process memory
2. **Library Mapping**: Loads required shared libraries into address space
3. **Runtime Relocation**: Adjusts addresses for actual memory locations
4. **Environment Setup**: Prepares stack, heap, and transfers control to entry point

**Practical Example:** Executing `./simple_program` triggers the loader to:
- Allocate memory for the process
- Map necessary shared libraries (visible via `ldd`)
- Initialize execution environment
- Jump to program entry point

## Compilation Guide

### Build everything:
```bash
make all
```

### Execute programs:
```bash
./process_creation
./linked_program
./simple_program
```

### Inspect library dependencies:
```bash
ldd simple_program
```

## Project License

Licensed under the MIT License. See [LICENSE](LICENSE) for complete terms.

---
