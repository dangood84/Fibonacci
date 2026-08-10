program FibonacciPython;

{ Pascal implementation that uses Python for arbitrary precision arithmetic
  This is a workaround since Pascal doesn't have standard bignum support
  Requires: Python 3 installed on the system
  Run: fpc Fibonacci_python.pas && ./Fibonacci_python }

uses
    Process, SysUtils;

function PythonAdd(a, b: String): String;
var
    AProcess: TProcess;
    OutputLines: TStringList;
    Command: String;
begin
    AProcess := TProcess.Create(nil);
    OutputLines := TStringList.Create;
    try
        AProcess.Executable := 'python3';
        Command := 'print(' + a + ' + ' + b + ')';
        AProcess.Parameters.Add('-c');
        AProcess.Parameters.Add(Command);
        AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
        AProcess.Execute;
        OutputLines.LoadFromStream(AProcess.Output);
        if OutputLines.Count > 0 then
            Result := Trim(OutputLines[0])
        else
            Result := '0';
    finally
        OutputLines.Free;
        AProcess.Free;
    end;
end;

var
    i, n: Integer;
    t1, t2, nextTerm: String;

begin
    t1 := '0';
    t2 := '1';
    
    Write('Enter the number of terms: ');
    ReadLn(n);
    
    WriteLn('Fibonacci Series (using Python for arbitrary precision):');
    
    for i := 1 to n do
    begin
        Write(t1, ', ');
        nextTerm := PythonAdd(t1, t2);
        t1 := t2;
        t2 := nextTerm;
    end;
    
    WriteLn;
end.
