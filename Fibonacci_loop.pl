% Fibonacci sequence generator - prints first N terms
% Run with: swipl -s Fibonacci_loop.pl -g main -t halt
% 
% Good news: SWI-Prolog (and most modern Prolog implementations) has
% built-in arbitrary precision integer arithmetic!
% The 'is' operator automatically handles large integers without overflow.
% This means F(100) and beyond work correctly without any code changes.
% No BigInt or special libraries needed - it just works!

main :-
    write('Enter the number of terms: '),
    flush_output,
    read_line_to_string(user_input, Line),
    number_string(N, Line),
    write('Fibonacci Series: '),
    print_fibonacci(N),
    nl.

% Print N fibonacci numbers using an iterative approach
print_fibonacci(N) :-
    N > 0,
    print_fib_loop(1, N, 0, 1).

print_fibonacci(0).

% Helper predicate: print_fib_loop(CurrentIndex, MaxTerms, T1, T2)
% T1 and T2 are the previous two fibonacci numbers
% These automatically use arbitrary precision integers
print_fib_loop(I, N, T1, T2) :-
    I =< N,
    format('~w, ', [T1]),
    NextTerm is T1 + T2,  % The 'is' operator handles arbitrary precision
    I1 is I + 1,
    print_fib_loop(I1, N, T2, NextTerm).

print_fib_loop(I, N, _, _) :-
    I > N.
