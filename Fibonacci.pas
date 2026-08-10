program Fibonacci;

var
    i, n: Integer;
    { Original: t1, t2, nextTerm: Integer;
      Pascal's Integer type is typically 32-bit (max ~2.1 billion)
      This overflows around F(47)
      
      Using Int64 (or QWord for unsigned) provides 64-bit integers
      This extends range up to F(93) before overflow
      
      For F(100) and beyond, you would need arbitrary precision libraries
      Free Pascal has some support through external libraries, but it's not standard
      
      This version uses Int64 for extended range up to F(93) }
    t1, t2, nextTerm: Int64;  { 64-bit signed integers for extended range }

begin
    t1 := 0;
    t2 := 1;
    
    Write('Enter the number of terms: ');
    ReadLn(n);
    
    Write('Fibonacci Series: ');
    WriteLn('(Note: accurate up to F(93), values beyond will overflow)');
    
    for i := 1 to n do
    begin
        Write(t1, ', ');
        nextTerm := t1 + t2;
        t1 := t2;
        t2 := nextTerm;
    end;
    
    WriteLn;
end.
