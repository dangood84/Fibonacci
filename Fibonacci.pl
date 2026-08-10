% Fibonacci sequence generator - recursive approach
% 
% Good news: SWI-Prolog (and most modern Prolog implementations) has
% built-in arbitrary precision integer arithmetic!
% The 'is' operator automatically handles large integers without overflow.
% This means F(100) and beyond work correctly without any code changes.
% 
% Note: The recursive approach here is inefficient for large N due to
% exponential time complexity. See Fibonacci_loop.pl for a faster version.

fib(0,1).
fib(1,1).
fib(N,F) :-
   N>1,
   N1 is N-1,
   N2 is N-2,
   fib(N1,F1),
   fib(N2,F2),
   F is F1+F2.  % The 'is' operator handles arbitrary precision integers
   