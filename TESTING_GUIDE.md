# Quick Testing Reference for 100-Term Fibonacci

## 🚀 Easiest Way - Use the Makefile

For C/C++ versions, just use `make`:

```bash
# Install libraries first
brew install gmp boost  # macOS
# OR
sudo apt-get install libgmp-dev libboost-all-dev  # Linux

# Build and test
make gmp                # Build C with GMP
make test               # Build and test with validation
make boost              # Build C++ with Boost (if installed)
make all                # Build both
make clean              # Clean up

# Run
echo "100" | ./fibonacci_gmp_c
```

---

## ✅ Ready to Test (No Installation Required)

### JavaScript
```bash
echo "100" | node fibonacci.js
```

### TypeScript
```bash
# Direct execution (recommended)
npm install && echo "100" | npx ts-node Fibonacci.ts

# Or compile and run
tsc Fibonacci.ts && echo "100" | node Fibonacci.js
```

### Java
```bash
javac Fibonacci.java && echo "100" | java Fibonacci
```

### Prolog (Iterative - Fast)
```bash
echo "100" | swipl -s Fibonacci_loop.pl -g main -t halt
```

### Shell Script with bc
```bash
echo "100" | bash Fibonacci_bc.sh
```

---

## 🔧 Requires Installation

### C with GMP

**Install:**
```bash
# macOS
brew install gmp

# Ubuntu/Debian
sudo apt-get install libgmp-dev
```

**Test (RECOMMENDED - works on all systems):**
```bash
gcc Fibonacci_gmp.c -o fibonacci_gmp_c $(pkg-config --cflags --libs gmp) && echo "100" | ./fibonacci_gmp_c
```

**Alternative manual compilation:**
```bash
# macOS (Apple Silicon)
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -I/opt/homebrew/include -L/opt/homebrew/lib -lgmp && echo "100" | ./fibonacci_gmp_c

# macOS (Intel)
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -I/usr/local/include -L/usr/local/lib -lgmp && echo "100" | ./fibonacci_gmp_c

# Linux
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -lgmp && echo "100" | ./fibonacci_gmp_c
```

### C++ with Boost

**Install:**
```bash
# macOS
brew install boost

# Ubuntu/Debian
sudo apt-get install libboost-all-dev
```

**Test:**
```bash
# macOS (Apple Silicon)
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp -I/opt/homebrew/include && echo "100" | ./fibonacci_boost_cpp

# macOS (Intel)
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp -I/usr/local/include && echo "100" | ./fibonacci_boost_cpp

# Linux
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp && echo "100" | ./fibonacci_boost_cpp
```

### Pascal with BigNum (String-Based)

**Test:**
```bash
fpc Fibonacci_bignum.pas -ofibonacci_bignum_pas && echo "100" | ./fibonacci_bignum_pas
```

### Fortran with BigNum (String-Based)

**Test:**
```bash
gfortran Fibonacci_bignum.f90 -o fibonacci_bignum_f90 && echo "100" | ./fibonacci_bignum_f90
```

---

## 📊 Expected Results

When you enter **100** terms, you should see 100 Fibonacci numbers printed.

**Key Checkpoints:**
- **F(10)** = 55 (2 digits)
- **F(50)** = 12,586,269,025 (11 digits)
- **F(93)** = 12,200,160,415,121,876,738 (20 digits) - _Last number fitting in 64-bit_
- **F(99)** = 218,922,995,834,555,169,026 (21 digits) - _100th term (0-indexed)_
- **F(100)** = 354,224,848,179,261,915,075 (21 digits) - _101st term (enter 101)_

**Last number for 100 terms should be:**
```
218922995834555169026
```

---

## 🚫 Limitations of Standard Versions

| File | Max Accurate Term | Reason |
|------|------------------|---------|
| Fibonacci.c | F(93) | 64-bit `unsigned long long` |
| Fibonacci.cpp | F(93) | 64-bit `unsigned long long` |
| Fibonacci.pas | F(93) | 64-bit `Int64` |
| Fibonacci.f90 | F(93) | 64-bit `integer(kind=8)` |
| Fibonacci.sh | F(93) | Bash 64-bit arithmetic |

---

## 🎯 Quick Validation Test

Test all working versions at once:

```bash
# JavaScript
echo "10" | node fibonacci.js | tail -1

# Shell with bc
echo "10" | bash Fibonacci_bc.sh | tail -1

# Java
javac Fibonacci.java && echo "10" | java Fibonacci | tail -1
```

All should output:
```
0, 1, 1, 2, 3, 5, 8, 13, 21, 34,
```

---

## 💡 Performance Comparison

For 100 terms on typical modern hardware:

| Implementation | Time | Notes |
|---------------|------|-------|
| JavaScript BigInt | < 1ms | Very fast |
| Java BigInteger | < 1ms | Very fast |
| C with GMP | < 1ms | Highly optimized |
| C++ with Boost | < 1ms | Highly optimized |
| Prolog (iterative) | ~10ms | Interpreted |
| Shell with bc | ~500ms | Process spawning overhead |
| Pascal string-based | ~100ms | Custom arithmetic |
| Fortran string-based | ~100ms | Custom arithmetic |

---

## 🐛 Troubleshooting

### GMP not found (gmp.h error on line 10)

**BEST SOLUTION - Use pkg-config (automatically finds paths):**
```bash
gcc Fibonacci_gmp.c -o fibonacci_gmp_c $(pkg-config --cflags --libs gmp)
```

**Alternative - Manual paths:**
```bash
# macOS - After installing with Homebrew:
brew install gmp

# Apple Silicon Macs (M1/M2/M3):
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -I/opt/homebrew/include -L/opt/homebrew/lib -lgmp

# Intel Macs:
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -I/usr/local/include -L/usr/local/lib -lgmp

# Linux
sudo apt-get install libgmp-dev
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -lgmp
```

### Boost not found
```bash
# macOS - After installing with Homebrew:
brew install boost

# Apple Silicon Macs (M1/M2/M3):
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp -I/opt/homebrew/include

# Intel Macs:
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp -I/usr/local/include

# Linux
sudo apt-get install libboost-all-dev
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp
```

### bc not found (rare)
```bash
# macOS (should be pre-installed)
# If missing, install via Homebrew
brew install bc

# Linux
sudo apt-get install bc
```

### TypeScript not found
```bash
npm install -g typescript
```

### SWI-Prolog not found
```bash
# macOS
brew install swi-prolog

# Ubuntu/Debian
sudo apt-get install swi-prolog
```

---

## 📝 One-Liner Test All Available

This will test all versions that don't require compilation or external libraries:

```bash
echo "=== JavaScript ===" && echo "10" | node fibonacci.js && \
echo -e "\n=== Shell with bc ===" && echo "10" | bash Fibonacci_bc.sh && \
echo -e "\n=== Java ===" && javac Fibonacci.java && echo "10" | java Fibonacci
```
