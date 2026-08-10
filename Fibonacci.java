import java.util.Scanner;
import java.math.BigInteger;

public class Fibonacci {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter the number of terms: ");
        int n = scanner.nextInt();
        
        // Original: int t1 = 0, t2 = 1;
        // Java's int type is a 32-bit signed integer with max value 2,147,483,647
        // Fibonacci numbers exceed this around F(47), causing overflow
        // BigInteger class provides arbitrary precision for large values
        BigInteger t1 = BigInteger.ZERO; // Using BigInteger for arbitrary precision
        BigInteger t2 = BigInteger.ONE;
        System.out.print("Fibonacci Series: ");
        
        for (int i = 1; i <= n; i++) {
            System.out.print(t1 + ", ");
            BigInteger nextTerm = t1.add(t2); // BigInteger uses .add() method
            t1 = t2;
            t2 = nextTerm;
        }
        
        System.out.println();
        scanner.close();
    }
}
