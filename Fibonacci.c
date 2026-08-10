#include <stdio.h>

// NOTE: This C implementation cannot accurately handle 100 Fibonacci terms
// Original: int t1 = 0, t2 = 1, nextTerm;
// C's int type is typically 32-bit (max ~2.1 billion), overflows around F(47)
// Even unsigned long long (64-bit, max ~18 quintillion) overflows around F(93)
// 
// To handle F(100) and beyond, you would need:
// - GMP library (GNU Multiple Precision): https://gmplib.org/
// - Example: #include <gmp.h> and use mpz_t type with mpz_add()
// 
// For now, this shows values up to the limit of unsigned long long

int main()
{
	int i, n;
	// Using unsigned long long instead of int for extended range (up to F(93))
	// Original type: int (overflows at F(47))
	unsigned long long t1 = 0, t2 = 1, nextTerm;

	printf("Enter the number of terms: ");
	scanf("%d", &n);

	printf("Fibonacci Series: ");
	printf("(Note: accurate up to F(93), values beyond will overflow)\n");

	for (i = 1; i <= n; ++i)
	{
		printf("%llu, ", t1);
		nextTerm = t1 + t2;
		t1 = t2;
		t2 = nextTerm;
	}
	printf("\n");
	return 0;
}