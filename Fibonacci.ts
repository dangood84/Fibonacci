import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter the number of terms: ', (n: string) => {
    const terms: number = parseInt(n);
    // Original: let t1: number = 0; let t2: number = 1;
    // TypeScript's number type (same as JavaScript) uses 64-bit floating point
    // Limited to ~15-16 digits precision, causing errors for large Fibonacci numbers
    // bigint type provides arbitrary precision for accurate calculations
    let t1: bigint = 0n; // Using bigint (note the 'n' suffix)
    let t2: bigint = 1n;
    let result: string = "Fibonacci Series: ";
    
    for (let i: number = 1; i <= terms; i++) {
        result += t1 + ", ";
        let nextTerm: bigint = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
    }
    
    console.log(result);
    rl.close();
});
