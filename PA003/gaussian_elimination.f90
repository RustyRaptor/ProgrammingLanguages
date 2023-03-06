program read_matrix_from_args
        use mymodule
        implicit none
        integer :: i, j, n, m, index_of_input, s
        ! real :: next_argument_real
        character (len=128):: nchar, mchar, next_argument
        character (len=9999999):: input_array
        character (len=2048) :: file_name
        integer :: file_unit, file_size, status
        real, dimension(:,:), allocatable :: matrix
        real, dimension(:), allocatable :: input_list
        REAL,DIMENSION(:), allocatable:: result_vector
        
        file_unit = 10
        ! Get the number of rows and columns from the command line
        if (command_argument_count() < 3) then
                print *, "Usage: read_matrix_from_args n m\n"
                stop
        endif

        call getarg(1, nchar)
        call getarg(2, mchar)

        read(nchar, *) n
        read(mchar, *) m

        call getarg(3, file_name)

        ! Open the file
        open(newunit=file_unit, file=file_name, status='old', action='read', iostat=status)
        if (status /= 0) then
                write(*,*) "Error opening file: ", file_name
                stop
        end if

        ! Determine the size of the file
        inquire(unit=file_unit, size=file_size) 
        ! Allocate memory for the file contents
        ! allocate(input_array(file_size))


        ! Read the file into the string
        read(file_unit, '(a)', iostat=status) input_array

        ! Allocate memory for the matrix
        allocate(matrix(n,m))
        allocate(input_list(n*m))
        allocate(result_vector(n))
        
        input_list = string_to_real_array(input_array, n*m)

        ! write (*, '(f20.5)') input_list(1)
        
        

        index_of_input = 1
        ! Read values from the file string into the matrix
        do i = 1, n
                do j = 1, m
                        matrix(i,j) = input_list(index_of_input)
                        ! write ( * , '(f20.5)', advance="no") matrix(i,j)
                        ! write ( * , '(f20.5)') input_list(index_of_input)
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
        
!   ! Deallocate the matrix
        ! deallocate(matrix)
        ! close(file_unit)
        ! deallocate(input_list)
end program read_matrix_from_args


