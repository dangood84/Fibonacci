# Fibonacci Implementation Comparison

## Summary Table

| Language | Standard Version | 100-Term Version | Max Terms (Standard) | External Dependency | Performance (100 terms) |
|----------|-----------------|------------------|---------------------|---------------------|------------------------|
| **C** | Fibonacci.c | Fibonacci_gmp.c | 93 | GMP library | ⚡ Very Fast (<1ms) |
| **C++** | Fibonacci.cpp | Fibonacci_boost.cpp | 93 | Boost library | ⚡ Very Fast (<1ms) |
| **Java** | Fibonacci.java | _(same)_ | ∞ | ✅ Built-in | ⚡ Very Fast (<1ms) |
| **JavaScript** | fibonacci.js | _(same)_ | ∞ | ✅ Built-in | ⚡ Very Fast (<1ms) |
| **TypeScript** | Fibonacci.ts | _(same)_ | ∞ | ✅ Built-in | ⚡ Very Fast (<1ms) |
| **Prolog** | Fibonacci_loop.pl | _(same)_ | ∞ | ✅ Built-in | 🚀 Fast (~10ms) |
| **Pascal** | Fibonacci.pas | Fibonacci_bignum.pas | 93 | ❌ None (string-based) | 🐢 Medium (~100ms) |
| **Fortran** | Fibonacci.f90 | Fibonacci_bignum.f90 | 93 | ❌ None (string-based) | 🐢 Medium (~100ms) |
| **Shell** | Fibonacci.sh | Fibonacci_bc.sh | 93 | bc (pre-installed) | 🐌 Slow (~500ms) |

**Legend:**
- ∞ = Arbitrary precision (limited only by memory)
- Max Terms = Last accurate Fibonacci number before overflow
- ✅ = No external dependencies
- ❌ = No dependencies (self-contained implementation)

---

## Detailed Comparison

### C Implementations

#### Standard: [Fibonacci.c](Fibonacci.c)
```c
unsigned long long t1 = 0, t2 = 1;
```
- **Type**: 64-bit unsigned integer
- **Max Value**: 18,446,744,073,709,551,615
- **Overflows at**: F(93) = 12,200,160,415,121,876,738
- **Pros**: Fast, no dependencies, simple
- **Cons**: Limited range

#### 100-Term: [Fibonacci_gmp.c](Fibonacci_gmp.c)
```c
mpz_t t1, t2, nextTerm;
mpz_init_set_ui(t1, 0);
```
- **Library**: GMP (GNU Multiple Precision)
- **Installation**: `brew install gmp` or `apt-get install libgmp-dev`
- **Compile**: `gcc -lgmp`
- **Pros**: Industry standard, very fast, unlimited precision
- **Cons**: External dependency

---

### C++ Implementations

#### Standard: [Fibonacci.cpp](Fibonacci.cpp)
```cpp
unsigned long long t1 = 0, t2 = 1;
```
- **Type**: 64-bit unsigned integer
- **Same limitations as C**

#### 100-Term: [Fibonacci_boost.cpp](Fibonacci_boost.cpp)
```cpp
using namespace boost::multiprecision;
cpp_int t1 = 0, t2 = 1;
```
- **Library**: Boost Multiprecision
- **Installation**: `brew install boost` or `apt-get install libboost-all-dev`
- **Compile**: `g++` (header-only, no linking required)
- **Pros**: Native C++ syntax, operator overloading, unlimited precision
- **Cons**: External dependency, Boost is large

---

### Java Implementation

#### [Fibonacci.java](Fibonacci.java)
```java
BigInteger t1 = BigInteger.ZERO;
BigInteger t2 = BigInteger.ONE;
```
- **Type**: `java.math.BigInteger`
- **Built-in**: Yes, part of Java standard library
- **Pros**: No external dependencies, fast, unlimited precision
- **Cons**: Verbose syntax (`.add()` instead of `+`)
- **Best for**: When you need portability and don't want dependencies

---

### JavaScript Implementation

#### [fibonacci.js](fibonacci.js)
```javascript
let t1 = 0n, t2 = 1n;  // Note the 'n' suffix
```
- **Type**: `BigInt` (ES2020+)
- **Built-in**: Yes (Node.js 10.4+, all modern browsers)
- **Pros**: Clean syntax, no dependencies, very fast, unlimited precision
- **Cons**: Requires modern JavaScript runtime
- **Best for**: Quick scripting, web applications

---

### TypeScript Implementation

#### [Fibonacci.ts](Fibonacci.ts)
```typescript
let t1: bigint = 0n;
let t2: bigint = 1n;
```
- **Type**: `bigint`
- **Built-in**: Yes (same as JavaScript)
- **Pros**: Type safety + BigInt performance, unlimited precision
- **Cons**: Requires ts-node or compilation step
- **Run directly**: `npm install && npx ts-node Fibonacci.ts`
- **Or compile**: `tsc Fibonacci.ts && node Fibonacci.js`
- **Best for**: Type-safe applications

---

### Prolog Implementations

#### Recursive: [Fibonacci.pl](Fibonacci.pl)
```prolog
fib(N,F) :- N>1, N1 is N-1, fib(N1,F1), ...
```
- **Built-in**: Arbitrary precision integers
- **Performance**: ❌ Exponential time complexity
- **Best for**: Small numbers (< 30), educational purposes

#### Iterative: [Fibonacci_loop.pl](Fibonacci_loop.pl)
```prolog
print_fib_loop(I, N, T1, T2) :- NextTerm is T1 + T2, ...
```
- **Built-in**: Arbitrary precision integers
- **Performance**: ✅ Linear time complexity
- **Best for**: Practical use, any size

---
### Python Implementations

#### Iterative: [Fibonacci.py](Fibonacci.py)
```python
t1, t2 = 0, 1
for _ in range(n):
    result.append(t1)
    t1, t2 = t2, t1 + t2
```
- **Type**: `int` (arbitrary precision by default)
- **Built-in**: Yes, no imports needed
- **Pros**: Clean syntax, fast, unlimited precision, no dependencies
- **Best for**: Quick scripting, data science, general programming

#### Generator: [Fibonacci_generator.py](Fibonacci_generator.py)
```python
def fibonacci_generator():
    t1, t2 = 0, 1
    while True:
        yield t1
        t1, t2 = t2, t1 + t2
```
- **Pattern**: Generator (lazy evaluation)
- **Pros**: Memory efficient, Pythonic idiom
- **Best for**: Streaming large sequences, memory-constrained environments

#### Recursive: [Fibonacci_recursive.py](Fibonacci_recursive.py)
```python
@lru_cache(maxsize=None)
def fibonacci_recursive(n):
    if n <= 1: return n
    return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
```
- **Pattern**: Recursion with `@lru_cache` memoization
- **Pros**: Elegant, automatic caching, shows functional style
- **Best for**: Educational purposes, functional programming fans

---
### Pascal Implementations

#### Standard: [Fibonacci.pas](Fibonacci.pas)
```pascal
var t1, t2, nextTerm: Int64;
```
- **Type**: 64-bit signed integer
- **Max Value**: 9,223,372,036,854,775,807
- **Overflows at**: F(93)

#### 100-Term: [Fibonacci_bignum.pas](Fibonacci_bignum.pas)
```pascal
type BigNumString = String[1000];
function BigNumAdd(a, b: BigNumString): BigNumString;
```
- **Method**: String-based arithmetic
- **Implementation**: Custom digit-by-digit addition
- **Pros**: No external dependencies, educational
- **Cons**: Slower than library solutions (~100ms for 100 terms)
- **Best for**: Learning how bignum arithmetic works

---

### Fortran Implementations

#### Standard: [Fibonacci.f90](Fibonacci.f90)
```fortran
integer(kind=8) :: t1, t2, nextTerm
```
- **Type**: 64-bit integer
- **Overflows at**: F(93)

#### 100-Term: [Fibonacci_bignum.f90](Fibonacci_bignum.f90)
```fortran
character(len=500) :: t1, t2, nextTerm
call bignum_add(t1, t2, nextTerm)
```
- **Method**: String-based arithmetic
- **Implementation**: Character array manipulation
- **Pros**: No external dependencies, self-contained
- **Cons**: Slower than library solutions
- **Best for**: Environments without bignum libraries

---

### Shell Script Implementations

#### Standard: [Fibonacci.sh](Fibonacci.sh)
```bash
t1=0; t2=1
nextTerm=$((t1 + t2))
```
- **Type**: Bash integer arithmetic (64-bit)
- **Overflows at**: F(93)

#### 100-Term: [Fibonacci_bc.sh](Fibonacci_bc.sh)
```bash
nextTerm=$(echo "$t1 + $t2" | bc)
```
- **Method**: External `bc` calculator
- **Dependency**: `bc` (pre-installed on Unix systems)
- **Pros**: Simple, no installation needed
- **Cons**: Slow due to process spawning (~500ms for 100 terms)
- **Best for**: Quick scripts, one-off calculations

---

### Python Implementations

#### Iterative: [Fibonacci.py](Fibonacci.py)
```python
t1, t2 = 0, 1
for _ in range(n):
    result.append(t1)
    t1, t2 = t2, t1 + t2
```
- **Type**: `int` (arbitrary precision by default)
- **Built-in**: Yes, no imports needed
- **Pros**: Clean syntax, fast, unlimited precision, no dependencies
- **Best for**: Quick scripting, data science, general programming

#### Generator: [Fibonacci_generator.py](Fibonacci_generator.py)
```python
def fibonacci_generator():
    t1, t2 = 0, 1
    while True:
        yield t1
        t1, t2 = t2, t1 + t2
```
- **Pattern**: Generator (lazy evaluation)
- **Pros**: Memory efficient, Pythonic idiom, can generate infinite sequences
- **Best for**: Streaming large sequences, memory-constrained environments

#### Recursive: [Fibonacci_recursive.py](Fibonacci_recursive.py)
```python
@lru_cache(maxsize=None)
def fibonacci_recursive(n):
    if n <= 1: return n
    return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
```
- **Pattern**: Recursion with `@lru_cache` memoization
- **Pros**: Elegant, automatic caching, shows functional style
- **Best for**: Educational purposes, functional programming fans

---

## Choosing the Right Implementation

### For Speed (100 terms in <1ms)
1. **Python** - Cleanest syntax, widely available
2. **JavaScript/TypeScript** - Easiest to run in browser/Node.js
3. **Java** - Most portable across platforms
4. **C with GMP** - Fastest absolute performance
5. **C++ with Boost** - Fastest with native C++ syntax

### For No Dependencies
1. **Python** - Built-in arbitrary precision
2. **JavaScript/TypeScript** - Built-in BigInt
3. **Java** - Built-in BigInteger
4. **Prolog** - Built-in arbitrary precision
5. **Pascal/Fortran bignum** - Self-contained string arithmetic

### For Learning
1. **Pascal/Fortran bignum** - Shows how bignum works internally
2. **Prolog recursive** - Shows mathematical definition
3. **C/C++ standard** - Shows overflow behavior

### For Production Use
1. **JavaScript/TypeScript** - Modern web/Node.js apps
2. **Java** - Enterprise applications
3. **C with GMP** - High-performance computing
4. **C++ with Boost** - Scientific computing

---

## Compilation and Execution Summary

### No Compilation Required
```bash
python3 Fibonacci.py                           # Python
node fibonacci.js                              # JavaScript
swipl -s Fibonacci_loop.pl -g main -t halt    # Prolog
bash Fibonacci_bc.sh                          # Shell
```

### Simple Compilation
```bash
javac Fibonacci.java && java Fibonacci                     # Java
tsc Fibonacci.ts && node Fibonacci.js                      # TypeScript (compile)
npm install && npx ts-node Fibonacci.ts                    # TypeScript (direct)
```

### Compilation with Libraries
```bash
gcc Fibonacci_gmp.c -o fibonacci_gmp_c -lgmp && ./fibonacci_gmp_c      # C + GMP
g++ Fibonacci_boost.cpp -o fibonacci_boost_cpp && ./fibonacci_boost_cpp        # C++ + Boost
```

### Compilation (Self-Contained)
```bash
fpc Fibonacci_bignum.pas -ofibonacci_bignum_pas && ./fibonacci_bignum_pas           # Pascal
gfortran Fibonacci_bignum.f90 -o fibonacci_bignum_f90 && ./fibonacci_bignum_f90           # Fortran
```

---

## Memory Usage (Approximate for 100 terms)

| Implementation | Memory per Number | Total Memory |
|---------------|-------------------|--------------|
| JavaScript BigInt | ~32 bytes | ~3.2 KB |
| Java BigInteger | ~40 bytes | ~4 KB |
| C GMP | ~24 bytes | ~2.4 KB |
| C++ Boost | ~32 bytes | ~3.2 KB |
| String-based | ~21 bytes | ~2.1 KB |

*Note: These are rough estimates. Actual usage varies by implementation and runtime.*

---

## Code Complexity (Lines of Code)

| Language | Standard | 100-Term | Increase |
|----------|----------|----------|----------|
| C | 25 lines | 35 lines | +40% |
| C++ | 25 lines | 25 lines | 0% (just type change) |
| Java | 20 lines | 20 lines | 0% (already using BigInteger) |
| JavaScript | 15 lines | 15 lines | 0% (already using BigInt) |
| TypeScript | 18 lines | 18 lines | 0% (already using bigint) |
| Pascal | 25 lines | 60 lines | +140% (custom arithmetic) |
| Fortran | 28 lines | 80 lines | +186% (custom arithmetic) |
| Shell | 20 lines | 20 lines | 0% (just use bc) |
| Prolog | 10 lines | 10 lines | 0% (built-in support) |

---

## Recommended by Use Case

### "I want the fastest solution"
→ **C with GMP** or **C++ with Boost**

### "I don't want to install anything"
→ **JavaScript** (if Node.js already installed)  
→ **Shell with bc** (Unix/Linux/macOS)

### "I need it to work everywhere"
→ **Java** (JVM runs anywhere)

### "I'm building a web application"
→ **JavaScript** or **TypeScript**

### "I'm learning about big numbers"
→ **Pascal bignum** or **Fortran bignum** (see the algorithm)

### "I'm writing a script"
→ **JavaScript** (Node.js) or **Shell with bc**

### "I need maximum precision with minimal code"
→ **Prolog** (built-in arbitrary precision, concise syntax)
