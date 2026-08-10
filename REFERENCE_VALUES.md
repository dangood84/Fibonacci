# Fibonacci Reference Values

This document provides reference values for validating your Fibonacci implementations.

## First 20 Terms (F(0) through F(19))

```
F(0)  = 0
F(1)  = 1
F(2)  = 1
F(3)  = 2
F(4)  = 3
F(5)  = 5
F(6)  = 8
F(7)  = 13
F(8)  = 21
F(9)  = 34
F(10) = 55
F(11) = 89
F(12) = 144
F(13) = 233
F(14) = 377
F(15) = 610
F(16) = 987
F(17) = 1597
F(18) = 2584
F(19) = 4181
```

## Key Checkpoint Values

### F(30) - 7 digits
```
F(30) = 832040
```

### F(40) - 9 digits
```
F(40) = 102334155
```

### F(47) - 10 digits (Last value in 32-bit signed int)
```
F(47) = 2971215073
```

### F(50) - 11 digits
```
F(50) = 12586269025
```

### F(75) - 16 digits
```
F(75) = 2111485077978050
```

### F(90) - 19 digits
```
F(90) = 2880067194370816120
```

### F(93) - 20 digits (Last value in 64-bit unsigned int)
```
F(93) = 12200160415121876738
```

### F(94) - First overflow in 64-bit unsigned
```
F(94) = 19740274219868223167
```

### F(99) - 21 digits (100th term, 0-indexed)
```
F(99) = 218922995834555169026
```

### F(100) - 21 digits
```
F(100) = 354224848179261915075
```

### F(150) - 32 digits
```
F(150) = 9969216677189303386214405760200
```

### F(200) - 42 digits
```
F(200) = 280571172992510140037611932413038677189525
```

## Testing Your Implementation

### Test 1: Basic Functionality (10 terms)
**Input:** 10  
**Expected Output:**
```
0, 1, 1, 2, 3, 5, 8, 13, 21, 34,
```

### Test 2: Moderate Size (20 terms)
**Input:** 20  
**Last value should be:** 4181

### Test 3: 32-bit Limit (50 terms)
**Input:** 50  
**Last value should be:** 12586269025  
**Note:** Standard `int` implementations will show incorrect values after F(47)

### Test 4: 64-bit Limit (94 terms)
**Input:** 94  
**Last value should be:** 19740274219868223167  
**Note:** Standard `long long` implementations will show incorrect values after F(93)

### Test 5: 100 Terms (requires bignum)
**Input:** 100  
**Last value should be:** 218922995834555169026  
**Note:** Only bignum implementations will show correct values

### Test 6: 101 Terms (to see F(100))
**Input:** 101  
**Last value should be:** 354224848179261915075

## Overflow Detection

If your implementation shows these values, it has overflowed:

### At F(47) with 32-bit int:
- **Correct:** 2,971,215,073
- **After overflow:** Negative numbers or wrap-around values

### At F(93) with 64-bit unsigned:
- **Correct:** 12,200,160,415,121,876,738
- **After overflow:** Smaller numbers due to wrap-around

### Example of Overflow Output:
```
# 32-bit signed int overflow around F(47)
F(46) = 1836311903  ✓
F(47) = 2971215073  ✓
F(48) = -1323752223 ✗ (should be 4807526976)

# 64-bit unsigned long long overflow around F(93)
F(92) = 7540113804746346429  ✓
F(93) = 12200160415121876738 ✓
F(94) = 1293530146158671551  ✗ (should be 19740274219868223167)
```

## Mathematical Properties

### Golden Ratio Approximation
As n increases, F(n+1)/F(n) approaches φ (phi), the golden ratio:
```
φ = (1 + √5) / 2 ≈ 1.618033988749895
```

**Examples:**
- F(10)/F(9) = 55/34 ≈ 1.617647
- F(20)/F(19) = 6765/4181 ≈ 1.618034
- F(100)/F(99) ≈ 1.618033988749895 (very close to φ)

### Divisibility Rules
- F(n) is even if and only if n is divisible by 3
- F(n) is divisible by 5 if and only if n is divisible by 5
- gcd(F(m), F(n)) = F(gcd(m, n))

**Examples:**
```
F(3) = 2    (even)
F(6) = 8    (even)
F(9) = 34   (even)

F(5) = 5    (divisible by 5)
F(10) = 55  (divisible by 5)
```

## Verification Script

Use this one-liner to verify any implementation:

```bash
# Test and extract the 100th value
echo "100" | YOUR_COMMAND | grep -o '[0-9]\{21\}' | tail -1
# Should output: 218922995834555169026
```

## Common Mistakes

### Off-by-One Errors
Some implementations start with F(1)=1, F(2)=1 instead of F(0)=0, F(1)=1.

**Standard (correct):**
```
F(0)=0, F(1)=1, F(2)=1, F(3)=2, ...
```

**Alternative (shifted by 1):**
```
F(1)=1, F(2)=1, F(3)=2, F(4)=3, ...
```

If your implementation uses the alternative, add 1 to all indices in this document.

### Integer Type Confusion

**Signed vs Unsigned:**
- Signed 32-bit int: -2,147,483,648 to 2,147,483,647
- Unsigned 32-bit int: 0 to 4,294,967,295
- Signed 64-bit int: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
- Unsigned 64-bit int: 0 to 18,446,744,073,709,551,615

**Fibonacci is always positive, so unsigned types give one extra bit!**

### Floating Point Errors
Never use `float` or `double` for Fibonacci beyond ~F(70):
- Lost precision in large numbers
- F(100) stored as double loses accuracy

## Full Sequence (F(0) to F(100))

For the complete list, run a 100-term implementation and compare:

```bash
echo "101" | node fibonacci.js > my_output.txt
# Compare your output with the reference values above
```

Or use this Python one-liner to generate reference:
```python
python3 -c "a,b=0,1; [print(f'F({i})={a}') or (a:=a+b, b:=a-b) for i in range(101)]"
```

## Additional Resources

- [OEIS A000045](https://oeis.org/A000045) - The Fibonacci sequence in OEIS
- [Wikipedia](https://en.wikipedia.org/wiki/Fibonacci_number) - Comprehensive article
- [Wolfram MathWorld](https://mathworld.wolfram.com/FibonacciNumber.html) - Mathematical properties
