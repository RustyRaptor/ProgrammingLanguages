program gaussian_elimination

        ! Module with a function for reading a string of floats
        use mymodule

        implicit none
        integer :: i, j, n, m, index_of_input, s
        character (len=128):: nchar, mchar, next_argument
        character (len=9999999):: input_array
        character (len=2048) :: file_name
        integer :: file_unit, file_size, status
        real, dimension(:,:), allocatable :: matrix
        real, dimension(:), allocatable :: input_list
        REAL,DIMENSION(:), allocatable:: result_vector
        real(kind=8) :: elapsed_time, start_time, end_time
        
        file_unit = 10
        ! Get the number of rows and columns from the command line
        if (command_argument_count() /= 3) then
                print *, "Usage: gaussian_elimination height width filename\n"
                stop
        endif

        ! get the width and height
        call getarg(1, nchar)
        call getarg(2, mchar)

        ! convert them to integers
        read(nchar, *) n
        read(mchar, *) m

        ! get the filename
        call getarg(3, file_name)

        ! Open the file
        open(newunit=file_unit, file=file_name, status='old', action='read', iostat=status)
        if (status /= 0) then
                write(*,*) "Error opening file: ", file_name
                stop
        end if

        ! Determine the size of the file
        inquire(unit=file_unit, size=file_size) 

        ! Read the file into the string
        read(file_unit, '(a)', iostat=status) input_array

        ! Allocate memory for the matrix
        allocate(matrix(n,m))
        allocate(input_list(n*m))
        allocate(result_vector(n))
        
        
        ! Turn the string of numbers into an array of reals
        input_list = string_to_real_array(input_array, n*m)

        
        

        
        ! Read values from the file string into the matrix
        index_of_input = 1
        do i = 1, n
                do j = 1, m
                        matrix(i,j) = input_list(index_of_input)
                        index_of_input = index_of_input + 1
                end do
        end do
        
        ! gaussian elimination
        
        do j = 1,n
                do i = j + 1, n
                matrix(i, :) = matrix(i, :)-matrix(j, :) * matrix(i, j)/matrix(j, j)
                end do
        end do
        
        do i = n,1,-1
                s = matrix(i, n + 1)
                do j = i + 1, n
                        s = s - matrix(i, j) * result_vector(j)
                end do
                result_vector(i) = s/matrix(i,i)
        end do
        
        ! Deallocate the matrix
        deallocate(matrix)
        ! Close the file 
        close(file_unit)
        ! Deallocate the input array
        deallocate(input_list)
        ! Deallocate the result vector 
        deallocate(result_vector)
end program gaussian_elimination


