// Fibonacci with Boost Multiprecision Library
// Install Boost on macOS: brew install boost
// Install Boost on Ubuntu/Debian: sudo apt-get install libboost-all-dev
//
// Compile (works on most systems - Boost is header-only):
//   g++ Fibonacci_boost.cpp -o fibonacci_boost
//
// If boost headers not found, add include path:
//   macOS (Apple Silicon): g++ Fibonacci_boost.cpp -o fibonacci_boost -I/opt/homebrew/include
//   macOS (Intel):         g++ Fibonacci_boost.cpp -o fibonacci_boost -I/usr/local/include

#include <iostream>
#include <boost/multiprecision/cpp_int.hpp>

using namespace std;
using namespace boost::multiprecision;

int main()
{
    int i, n;
    cpp_int t1 = 0, t2 = 1, nextTerm;
    
    cout << "Enter the number of terms: ";
    cin >> n;
    
    cout << "Fibonacci Series (using Boost Multiprecision for arbitrary precision):" << endl;
    
    for (i = 1; i <= n; ++i)
    {
        cout << t1 << ", ";
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
    }
    
    cout << endl;
    
    return 0;
}
