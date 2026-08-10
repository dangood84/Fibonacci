program FibonacciBigNum;

{ Pascal implementation with string-based arbitrary precision arithmetic
  This implements addition of large numbers using strings
  No external dependencies required
  Compile: fpc Fibonacci_bignum.pas -ofibonacci_bignum_pas
  Run: ./fibonacci_bignum_pas }

type
    BigNumString = AnsiString;

{ Add two positive big numbers represented as strings }
function BigNumAdd(a, b: BigNumString): BigNumString;
var
    result: BigNumString;
    carry, sum, i, j, k: Integer;
    digitA, digitB: Integer;
begin
    result := '';
    carry := 0;
    i := Length(a);
    j := Length(b);
    
    while (i > 0) or (j > 0) or (carry > 0) do
    begin
        if i > 0 then
        begin
            digitA := Ord(a[i]) - Ord('0');
            Dec(i);
        end
        else
            digitA := 0;
            
        if j > 0 then
        begin
            digitB := Ord(b[j]) - Ord('0');
            Dec(j);
        end
        else
            digitB := 0;
            
        sum := digitA + digitB + carry;
        carry := sum div 10;
        result := Chr((sum mod 10) + Ord('0')) + result;
    end;
    
    BigNumAdd := result;
end;

var
    i, n: Integer;
    t1, t2, nextTerm: BigNumString;

begin
    t1 := '0';
    t2 := '1';
    
    Write('Enter the number of terms: ');
    ReadLn(n);
    
    WriteLn('Fibonacci Series (using string-based arbitrary precision):');
    
    for i := 1 to n do
    begin
        Write(t1, ', ');
        nextTerm := BigNumAdd(t1, t2);
        t1 := t2;
        t2 := nextTerm;
    end;
    
    WriteLn;
end.
