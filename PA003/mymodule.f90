module mymodule
  implicit none

  ! Define the string_to_real_array function
  contains
pure function string_to_real_array(str, n) result(arr)
        implicit none
        character(len=*), intent(in) :: str
        character(len=:), allocatable :: str_new
        character(len=10000) :: num_str
        character(len=10000) :: index_str
        integer, intent(in) :: n
        real, dimension(:), allocatable :: arr
        integer :: i, status, index_int, j, k
        str_new = str
        ! Allocate memory for the real array
        allocate(arr(n))

        ! Read each real number from the string and store it in the array
    !    i = 1
    !    do while (len_trim(str_new) > 0)
    !            read(str_new, '(f2.20)', iostat=status) arr(i)

   !             i = i + 1
!               index_int = index(str_new, ' ')
 !               str_new = adjustl(str_new(index_int+1:))
  !      end do
  
      ! Read each real number from the string and store it in the array
    i = 1
    j = 1
    do while (j <= n)
        k = index(str_new(j:), ' ')
        if (k == 0) k = len(str_new(j:)) + 1
        num_str = str_new(j:j+k-2)
        read(num_str, '(f20.5)', iostat=status) arr(i)
        i = i + 1
        j = j + k
    end do

end function string_to_real_array


end module mymodule

