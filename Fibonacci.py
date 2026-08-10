#!/usr/bin/env python3
"""
Fibonacci sequence implementation in Python
Python has built-in arbitrary precision integers - supports 100+ terms!
Run: python3 Fibonacci.py
"""

def fibonacci_iterative(n):
    """Generate first n Fibonacci numbers using iterative approach"""
    t1, t2 = 0, 1
    result = []
    
    for _ in range(n):
        result.append(t1)
        t1, t2 = t2, t1 + t2
    
    return result

def main():
    try:
        n = int(input("Enter the number of terms: "))
        
        if n <= 0:
            print("Please enter a positive integer")
            return
        
        print("Fibonacci Series:")
        fib_numbers = fibonacci_iterative(n)
        print(", ".join(map(str, fib_numbers)) + ", ")
        
    except ValueError:
        print("Invalid input. Please enter an integer.")
    except KeyboardInterrupt:
        print("\nInterrupted")

if __name__ == "__main__":
    main()
