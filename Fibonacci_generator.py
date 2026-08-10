#!/usr/bin/env python3
"""
Fibonacci sequence using Python generator pattern
Memory efficient - generates numbers on-demand
Run: python3 Fibonacci_generator.py
"""

def fibonacci_generator():
    """Generator that yields Fibonacci numbers indefinitely"""
    t1, t2 = 0, 1
    while True:
        yield t1
        t1, t2 = t2, t1 + t2

def main():
    try:
        n = int(input("Enter the number of terms: "))
        
        if n <= 0:
            print("Please enter a positive integer")
            return
        
        print("Fibonacci Series (using generator):")
        fib_gen = fibonacci_generator()
        result = [str(next(fib_gen)) for _ in range(n)]
        print(", ".join(result) + ", ")
        
    except ValueError:
        print("Invalid input. Please enter an integer.")
    except KeyboardInterrupt:
        print("\nInterrupted")

if __name__ == "__main__":
    main()
