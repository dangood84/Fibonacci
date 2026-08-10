# Fibonacci Sequence Implementations

A collection of Fibonacci sequence implementations across multiple programming languages, including versions that support calculating 100+ terms.

## Quick Links

- 📖 [Testing Guide](TESTING_GUIDE.md) - Quick commands to test all implementations
- 📊 [100-Term Summary](FIBONACCI_100_SUMMARY.md) - Detailed explanation of large number support
- ⚖️ [Comparison Table](COMPARISON.md) - Side-by-side comparison of all implementations
- � [Reference Values](REFERENCE_VALUES.md) - Expected Fibonacci values for validation
- �🚀 [Quick Start](#quick-start) - Get started immediately

## About the Fibonacci Sequence

The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, typically starting with 0 and 1:

```
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
```

## Quick Start

Test a 100-term implementation immediately (no installation required):

```bash
# JavaScript (fast, uses BigInt)
echo "100" | node fibonacci.js

# TypeScript (directly, uses bigint)
npm install && echo "100" | npx ts-node Fibonacci.ts

# Shell Script (uses bc calculator)
echo "100" | bash Fibonacci_bc.sh

# Java (uses BigInteger)
javac Fibonacci.java && echo "100" | java Fibonacci
```

**For C/C++ versions with external libraries (fastest performance):**

```bash
# Easy way - Use the Makefile:
brew install gmp boost  # Install libraries first
make gmp                # Build C with GMP
make test               # Build and test GMP version
echo "100" | ./fibonacci_gmp_c

# Or compile manually using pkg-config:
gcc Fibonacci_gmp.c -o fibonacci_gmp_c $(pkg-config --cflags --libs gmp)
echo "100" | ./fibonacci_gmp_c
```

For more testing commands, see the [Testing Guide](TESTING_GUIDE.md).

## Implementations

This repository contains Fibonacci sequence implementations in the following languages:

### C
- **Standard File**: [Fibonacci.c](Fibonacci.c) - Uses `unsigned long long` (accurate up to F(93))
  - **Compile**: `gcc Fibonacci.c -o fibonacci_c`
  - **Run**: `./fibonacci_c`
- **100-Term Version**: [Fibonacci_gmp.c](Fibonacci_gmp.c) - Uses GMP library for arbitrary precision
  - **Compile**: `gcc Fibonacci_gmp.c -o fibonacci_gmp_c -lgmp`
  - **Install GMP**: `brew install gmp` (macOS) or `sudo apt-get install libgmp-dev` (Linux)
  - **Run**: `./fibonacci_gmp_c`

### C++
- **Standard File**: [Fibonacci.cpp](Fibonacci.cpp) - Uses `unsigned long long` (accurate up to F(93))
  - **Compile**: `g++ Fibonacci.cpp -o fibonacci_cpp`
  - **Run**: `./fibonacci_cpp`
- **100-Term Version**: [Fibonacci_boost.cpp](Fibonacci_boost.cpp) - Uses Boost Multiprecision library
  - **Compile**: `g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp`
  - **Install Boost**: `brew install boost` (macOS) or `sudo apt-get install libboost-all-dev` (Linux)
  - **Run**: `./fibonacci_boost_cpp`

### Fortran
- **Standard File**: [Fibonacci.f90](Fibonacci.f90) - Uses 64-bit integers (accurate up to F(93))
  - **Compile**: `gfortran Fibonacci.f90 -o fibonacci_f90`
  - **Run**: `./fibonacci_f90`
- **100-Term Version**: [Fibonacci_bignum.f90](Fibonacci_bignum.f90) - String-based arbitrary precision
  - **Compile**: `gfortran Fibonacci_bignum.f90 -o fibonacci_bignum_f90`
  - **Run**: `./fibonacci_bignum_f90`
- **Python-Hybrid Version**: [Fibonacci_python_helper.f90](Fibonacci_python_helper.f90) - Uses Python for bignum arithmetic
  - **Compile**: `gfortran Fibonacci_python_helper.f90 -o fibonacci_python_f90`
  - **Requires**: Python 3 installed
  - **Run**: `./fibonacci_python_f90`

### Java
- **File**: [Fibonacci.java](Fibonacci.java) - Uses `BigInteger` (supports 100+ terms) ✓
- **Compile**: `javac Fibonacci.java`
- **Run**: `java Fibonacci`

### JavaScript (Node.js)
- **File**: [fibonacci.js](fibonacci.js) - Uses `BigInt` (supports 100+ terms) ✓
- **Run**: `node fibonacci.js`
- **Note**: Standalone implementation, not compiled from TypeScript

### TypeScript
- **File**: [Fibonacci.ts](Fibonacci.ts) - Uses `bigint` (supports 100+ terms) ✓
- **Run directly**: `npx ts-node Fibonacci.ts` (requires `npm install` first)
- **Or compile & run**: `tsc Fibonacci.ts && node Fibonacci.js`
- **Note**: When compiled, creates `Fibonacci.js` (capital F), different from the standalone `fibonacci.js`

### Pascal
- **Standard File**: [Fibonacci.pas](Fibonacci.pas) - Uses `Int64` (accurate up to F(93))
  - **Compile**: `fpc Fibonacci.pas`
  - **Run**: `./Fibonacci`
- **100-Term Version**: [Fibonacci_bignum.pas](Fibonacci_bignum.pas) - String-based arbitrary precision
  - **Compile**: `fpc Fibonacci_bignum.pas -ofibonacci_bignum_pas`
  - **Run**: `./fibonacci_bignum_pas`
  - **Fun Fact**: Originally used `String[1000]`, but Free Pascal limits traditional strings to 255 characters. Changed to `AnsiString` for unlimited length! 🎉
- **Python-Hybrid Version**: [Fibonacci_python.pas](Fibonacci_python.pas) - Uses Python for bignum arithmetic
  - **Compile**: `fpc Fibonacci_python.pas -ofibonacci_python_pas`
  - **Requires**: Python 3 installed
  - **Run**: `./fibonacci_python_pas`

### Prolog
- **Files**: 
  - [Fibonacci.pl](Fibonacci.pl) - Recursive (supports 100+ terms, but slow) ✓
  - [Fibonacci_loop.pl](Fibonacci_loop.pl) - Iterative (supports 100+ terms, fast) ✓
- **Run**: `swipl -s Fibonacci.pl` or `swipl -s Fibonacci_loop.pl -g main -t halt`
- **Note**: SWI-Prolog has built-in arbitrary precision integers

### Shell Script
- **Standard File**: [Fibonacci.sh](Fibonacci.sh) - Uses bash arithmetic (accurate up to F(93))
  - **Run**: `bash Fibonacci.sh` or `chmod +x Fibonacci.sh && ./Fibonacci.sh`
- **100-Term Version**: [Fibonacci_bc.sh](Fibonacci_bc.sh) - Uses `bc` calculator for arbitrary precision
  - **Run**: `bash Fibonacci_bc.sh` or `chmod +x Fibonacci_bc.sh && ./Fibonacci_bc.sh`
  - **Note**: `bc` is typically pre-installed on macOS/Linux

## Requirements

To run these implementations, you'll need the appropriate compiler or interpreter installed:

- **C/C++**: GCC or Clang
- **Fortran**: gfortran
- **Java**: JDK (Java Development Kit)
- **JavaScript**: Node.js
- **TypeScript**: Node.js and either:
  - `ts-node` for direct execution: `npm install` (installs from package.json)
  - Or `tsc` for compilation: `npm install -g typescript`
- **Pascal**: Free Pascal Compiler (fpc)
- **Prolog**: SWI-Prolog (`brew install swi-prolog` on macOS)
- **Shell**: Bash (usually pre-installed on macOS/Linux)

### Additional Requirements for 100-Term Versions

- **C (GMP version)**: GNU Multiple Precision library
  - macOS: `brew install gmp`
  - Linux: `sudo apt-get install libgmp-dev`
- **C++ (Boost version)**: Boost C++ Libraries
  - macOS: `brew install boost`
  - Linux: `sudo apt-get install libboost-all-dev`
- **Shell (bc version)**: `bc` calculator (usually pre-installed)

## 100-Term Support

The Fibonacci sequence grows exponentially, with F(100) being a 21-digit number: `354224848179261915075`

**Languages with Built-in Support (no changes needed):**
- ✓ **Java** - Uses `BigInteger` class
- ✓ **JavaScript** - Uses `BigInt` type (ES2020+)
- ✓ **TypeScript** - Uses `bigint` type
- ✓ **Prolog** - Built-in arbitrary precision integers

**Languages Requiring External Libraries:**
- **C** - Use GMP (GNU Multiple Precision) library → [Fibonacci_gmp.c](Fibonacci_gmp.c)
- **C++** - Use Boost Multiprecision library → [Fibonacci_boost.cpp](Fibonacci_boost.cpp)

**Languages Using Custom String-Based Arithmetic:**
- **Pascal** - String-based addition → [Fibonacci_bignum.pas](Fibonacci_bignum.pas)
- **Fortran** - String-based addition → [Fibonacci_bignum.f90](Fibonacci_bignum.f90)

**Languages Using System Utilities:**
- **Shell** - Uses `bc` calculator → [Fibonacci_bc.sh](Fibonacci_bc.sh)

**Languages Using Python for Bignum (Hybrid Approach):**
- **Pascal** - Shells out to Python → [Fibonacci_python.pas](Fibonacci_python.pas)
- **Fortran** - Shells out to Python → [Fibonacci_python_helper.f90](Fibonacci_python_helper.f90)

### Overflow Limitations

The standard implementations use native integer types with the following limits:
- **32-bit integers** (`int`): Accurate up to F(47) ≈ 2.97 billion
- **64-bit integers** (`long long`, `Int64`): Accurate up to F(93) ≈ 12.2 quintillion

## Project Structure

```
fibonacci/
├── Fibonacci.c                   # C implementation (up to F(93))
├── Fibonacci_gmp.c               # C with GMP library (100+ terms)
├── Fibonacci.cpp                 # C++ implementation (up to F(93))
├── Fibonacci_boost.cpp           # C++ with Boost (100+ terms)
├── Fibonacci.f90                 # Fortran implementation (up to F(93))
├── Fibonacci_bignum.f90          # Fortran with bignum (100+ terms)
├── Fibonacci_python_helper.f90   # Fortran using Python (100+ terms)
├── Fibonacci.java                # Java with BigInteger (100+ terms)
├── fibonacci.js                  # JavaScript with BigInt (100+ terms)
├── Fibonacci.ts                  # TypeScript with bigint (100+ terms)
├── Fibonacci.pas                 # Pascal implementation (up to F(93))
├── Fibonacci_bignum.pas          # Pascal with bignum (100+ terms)
├── Fibonacci_python.pas          # Pascal using Python (100+ terms)
├── Fibonacci.pl                  # Prolog recursive (100+ terms, slow)
├── Fibonacci_loop.pl             # Prolog iterative (100+ terms, fast)
├── Fibonacci.sh                  # Shell script (up to F(93))
├── Fibonacci_bc.sh               # Shell with bc (100+ terms)
├── COMPARISON.md                 # Side-by-side comparison table
├── FIBONACCI_100_SUMMARY.md      # Large number support details
├── REFERENCE_VALUES.md           # Expected Fibonacci values
├── TESTING_GUIDE.md              # Quick testing commands
├── Makefile                      # Easy compilation for C/C++ versions
├── package.json                  # Node.js package configuration
├── tsconfig.json                 # TypeScript configuration
└── README.md                     # This file
```

## License

Educational/demonstration purposes.
