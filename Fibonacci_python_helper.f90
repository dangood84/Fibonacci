program fibonacci_python
    ! Fortran implementation that uses Python for arbitrary precision arithmetic
    ! This is a workaround since Fortran doesn't have standard bignum support
    ! Requires: Python 3 installed on the system
    ! Compile: gfortran Fibonacci_python_helper.f90 -o fibonacci_python_helper
    
    implicit none
    integer :: i, n, stat
    character(len=1000) :: t1, t2, nextTerm, command, result
    
    t1 = '0'
    t2 = '1'
    
    print *, "Enter the number of terms: "
    read *, n
    
    print *, "Fibonacci Series (using Python for arbitrary precision):"
    
    do i = 1, n
        ! Print current term
        write(*, '(A)', advance='no') trim(t1) // ", "
        
        ! Use Python to add t1 + t2
        command = 'python3 -c "print(' // trim(t1) // ' + ' // trim(t2) // ')"'
        call execute_command_line(trim(command), exitstat=stat, cmdstat=stat)
        
        ! For simplicity, we'll create a Python script approach
        ! This inline approach is complex, so we'll use a simpler string-based method
        nextTerm = python_add(trim(t1), trim(t2))
        
        t1 = t2
        t2 = nextTerm
    end do
    
    print *
    
contains

    function python_add(a, b) result(sum_str)
        character(len=*), intent(in) :: a, b
        character(len=1000) :: sum_str
        character(len=2000) :: command
        integer :: unit_num, stat
        
        ! Create a temporary file for the result
        command = 'python3 -c "print(' // trim(a) // ' + ' // trim(b) // ')" > /tmp/fib_result.txt'
        call execute_command_line(trim(command), exitstat=stat)
        
        ! Read the result
        open(newunit=unit_num, file='/tmp/fib_result.txt', status='old', action='read')
        read(unit_num, '(A)') sum_str
        close(unit_num)
        
        sum_str = adjustl(sum_str)
    end function python_add
    
end program fibonacci_python
