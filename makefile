# Compiler configuration
COMPILER = gcc
COMPILE_FLAGS = -Wall -Wextra -std=c99
EXECUTABLES = process_creation linked_program simple_program

# Default target: build all executables
all: $(EXECUTABLES)
	@echo "Build completed: All programs compiled successfully"

# Build process creation demonstration
process_creation: process_creation.c
	$(COMPILER) $(COMPILE_FLAGS) -o process_creation process_creation.c
	@echo "[✓] process_creation executable created"

# Build multi-file linking demonstration
linked_program: file1.c file2.c
	$(COMPILER) $(COMPILE_FLAGS) -o linked_program file1.c file2.c
	@echo "[✓] linked_program executable created (file1.c + file2.c)"

# Build simple loader demonstration
simple_program: simple_program.c
	$(COMPILER) $(COMPILE_FLAGS) -o simple_program simple_program.c
	@echo "[✓] simple_program executable created"

# Execute all programs
run: all
	@echo "\n========== Executing: process_creation =========="
	./process_creation
	@echo "\n========== Executing: linked_program =========="
	./linked_program
	@echo "\n========== Executing: simple_program =========="
	./simple_program
	@echo "\n========== Dynamic Library Dependencies =========="
	ldd simple_program

# Remove compiled binaries
clean:
	rm -f $(EXECUTABLES)
	@echo "Cleanup complete: All executables removed"

.PHONY: all run clean
