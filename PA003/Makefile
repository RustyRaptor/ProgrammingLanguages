FC = gfortran -std=gnu
SRC = gaussian_elimination.f90
EXEC = gaussian_elimination
MODULE = mymodule.mod
MODF = mymodule.f90
RM = rm -f

all: $(EXEC)

$(EXEC): $(SRC) $(MODULE)
	$(FC) -c $(SRC)
	gfortran mymodule.o gaussian_elimination.o -o gaussian_elimination
	# $(FC) -o $(EXEC) $(SRC)
	

$(MODULE): $(MODF)
	$(FC) -c $(MODF)

clean:
	$(RM) *.o *.mod

test: clean gaussian_elimination
	# ./gaussian_elimination 3 4 1 2 3 4 5 6 7 8 9 10 11 12
	./gaussian_elimination 3 4 "matrix.txt"
