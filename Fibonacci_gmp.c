// Fibonacci with GMP (GNU Multiple Precision Arithmetic Library)
// Install GMP on macOS: brew install gmp
// Install GMP on Ubuntu/Debian: sudo apt-get install libgmp-dev
//
// RECOMMENDED: Compile using pkg-config (works on all systems):
//   gcc Fibonacci_gmp.c -o fibonacci_gmp $(pkg-config --cflags --libs gmp)
//
// Manual compile alternatives:
//   macOS (Apple Silicon): gcc Fibonacci_gmp.c -o fibonacci_gmp -I/opt/homebrew/include -L/opt/homebrew/lib -lgmp
//   macOS (Intel):         gcc Fibonacci_gmp.c -o fibonacci_gmp -I/usr/local/include -L/usr/local/lib -lgmp
//   Linux:                 gcc Fibonacci_gmp.c -o fibonacci_gmp -lgmp

#include <stdio.h>
#include <gmp.h>

int main()
{
    int i, n;
    mpz_t t1, t2, nextTerm;
    
    // Initialize GMP integers
    mpz_init_set_ui(t1, 0);  // t1 = 0
    mpz_init_set_ui(t2, 1);  // t2 = 1
    mpz_init(nextTerm);
    
    printf("Enter the number of terms: ");
    scanf("%d", &n);
    
    printf("Fibonacci Series (using GMP for arbitrary precision):\n");
    
    for (i = 1; i <= n; ++i)
    {
        gmp_printf("%Zd, ", t1);  // Print mpz_t integer
        mpz_add(nextTerm, t1, t2);  // nextTerm = t1 + t2
        mpz_set(t1, t2);            // t1 = t2
        mpz_set(t2, nextTerm);      // t2 = nextTerm
    }
    printf("\n");
    
    // Clean up GMP integers
    mpz_clear(t1);
    mpz_clear(t2);
    mpz_clear(nextTerm);
    
    return 0;
}
