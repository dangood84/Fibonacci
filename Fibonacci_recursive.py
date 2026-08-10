#!/usr/bin/env python3
"""
Fibonacci sequence using recursion with memoization
Demonstrates @lru_cache decorator for automatic memoization
Run: python3 Fibonacci_recursive.py
"""

from functools import lru_cache

@lru_cache(maxsize=None)
def fibonacci_recursive(n):
    """Calculate nth Fibonacci number using memoized recursion"""
    if n <= 1:
        return n
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

def main():
    try:
        n = int(input("Enter the number of terms: "))
        
        if n <= 0:
            print("Please enter a positive integer")
            return
        
        print("Fibonacci Series (using memoized recursion):")
        result = [str(fibonacci_recursive(i)) for i in range(n)]
        print(", ".join(result) + ", ")
        
        # Show cache statistics
        print(f"\nCache info: {fibonacci_recursive.cache_info()}")
        
    except ValueError:
        print("Invalid input. Please enter an integer.")
    except KeyboardInterrupt:
        print("\nInterrupted")
    except RecursionError:
        print("\nRecursion limit exceeded. Try a smaller number or use iterative version.")

if __name__ == "__main__":
    main()
