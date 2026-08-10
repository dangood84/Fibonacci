program fibonacci
    implicit none
    integer :: i, n
    ! Original: integer :: t1, t2, nextTerm
    ! Fortran's default integer is typically 32-bit (max ~2.1 billion)
    ! This overflows around F(47)
    ! 
    ! Using integer(kind=8) or integer*8 gives 64-bit integers (up to F(93))
    ! For F(100), you would need arbitrary precision libraries, which are
    ! not standard in Fortran and require external packages
    ! 
    ! This version uses integer(kind=8) for extended range up to F(93)
    integer(kind=8) :: t1, t2, nextTerm  ! 64-bit integers for extended range
    
    t1 = 0
    t2 = 1
    
    print *, "Enter the number of terms: "
    read *, n
    
    print *, "Fibonacci Series: "
    print *, "(Note: accurate up to F(93), values beyond will overflow)"
    
    do i = 1, n
        write(*, '(I0, A)', advance='no') t1, ", "
        nextTerm = t1 + t2
        t1 = t2
        t2 = nextTerm
    end do
    
    print *
    
end program fibonacci
