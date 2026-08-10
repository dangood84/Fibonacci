program fibonacci_bignum
    ! Fortran implementation with string-based arbitrary precision arithmetic
    ! This implements addition of large numbers using character strings
    ! No external dependencies required
    ! Compile: gfortran Fibonacci_bignum.f90 -o fibonacci_bignum
    
    implicit none
    integer :: i, n
    character(len=500) :: t1, t2, nextTerm
    
    t1 = '0'
    t2 = '1'
    
    print *, "Enter the number of terms: "
    read *, n
    
    print *, "Fibonacci Series (using string-based arbitrary precision):"
    
    do i = 1, n
        write(*, '(A)', advance='no') trim(t1) // ", "
        call bignum_add(t1, t2, nextTerm)
        t1 = t2
        t2 = nextTerm
    end do
    
    print *
    
contains

    ! Add two positive big numbers represented as strings
    subroutine bignum_add(a, b, result)
        character(len=*), intent(in) :: a, b
        character(len=*), intent(out) :: result
        integer :: carry, sum_digit, i, j, pos
        integer :: digit_a, digit_b
        character(len=500) :: temp_result
        integer :: len_a, len_b
        
        temp_result = ''
        carry = 0
        len_a = len_trim(a)
        len_b = len_trim(b)
        i = len_a
        j = len_b
        pos = 1
        
        do while ((i > 0) .or. (j > 0) .or. (carry > 0))
            if (i > 0) then
                digit_a = ichar(a(i:i)) - ichar('0')
                i = i - 1
            else
                digit_a = 0
            end if
            
            if (j > 0) then
                digit_b = ichar(b(j:j)) - ichar('0')
                j = j - 1
            else
                digit_b = 0
            end if
            
            sum_digit = digit_a + digit_b + carry
            carry = sum_digit / 10
            temp_result(pos:pos) = char(mod(sum_digit, 10) + ichar('0'))
            pos = pos + 1
        end do
        
        ! Reverse the result
        call reverse_string(temp_result(1:pos-1), result)
    end subroutine bignum_add
    
    ! Helper subroutine to reverse a string
    subroutine reverse_string(input, output)
        character(len=*), intent(in) :: input
        character(len=*), intent(out) :: output
        integer :: i, len_input
        
        len_input = len_trim(input)
        output = ''
        
        do i = len_input, 1, -1
            output(len_input-i+1:len_input-i+1) = input(i:i)
        end do
    end subroutine reverse_string
    
end program fibonacci_bignum
