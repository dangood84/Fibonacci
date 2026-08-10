# Makefile for Fibonacci implementations
# Usage: make all     - Build all C/C++ implementations
#        make gmp     - Build C with GMP
#        make boost   - Build C++ with Boost
#        make clean   - Remove compiled binaries

# Compiler settings
CC = gcc
CXX = g++
CFLAGS = -O2 -Wall
CXXFLAGS = -O2 -Wall

# GMP flags (using pkg-config for automatic path detection)
GMP_FLAGS = $(shell pkg-config --cflags --libs gmp 2>/dev/null || echo "-lgmp")

# Boost flags (header-only, try common paths)
BOOST_INCLUDE = $(shell [ -d /opt/homebrew/include ] && echo "-I/opt/homebrew/include" || \
                         [ -d /usr/local/include ] && echo "-I/usr/local/include" || echo "")

# Targets
.PHONY: all gmp boost clean test

all: gmp boost

gmp: fibonacci_gmp_c
	@echo "✓ Built C version with GMP"

boost: fibonacci_boost_cpp
	@echo "✓ Built C++ version with Boost"

fibonacci_gmp_c: Fibonacci_gmp.c
	$(CC) $(CFLAGS) Fibonacci_gmp.c -o fibonacci_gmp_c $(GMP_FLAGS)

fibonacci_boost_cpp: Fibonacci_boost.cpp
	$(CXX) $(CXXFLAGS) Fibonacci_boost.cpp -o fibonacci_boost_cpp $(BOOST_INCLUDE)

clean:
	rm -f fibonacci_gmp_c fibonacci_boost_cpp fibonacci_gmp fibonacci_boost *.o
	@echo "✓ Cleaned compiled files"

test: fibonacci_gmp_c
	@echo "Testing GMP version with 10 terms:"
	@echo "10" | ./fibonacci_gmp_c
	@echo ""
	@echo "Last value for 100 terms should be: 218922995834555169026"
	@echo "Actual last value:"
	@echo "100" | ./fibonacci_gmp_c | grep -o '[0-9]\{20,\}' | tail -1

help:
	@echo "Fibonacci Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  make all     - Build all C/C++ implementations"
	@echo "  make gmp     - Build C with GMP only"
	@echo "  make boost   - Build C++ with Boost only"
	@echo "  make test    - Build and test GMP version"
	@echo "  make clean   - Remove compiled binaries"
	@echo "  make help    - Show this help message"
