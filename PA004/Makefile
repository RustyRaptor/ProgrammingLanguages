FC = gfortran -std=gnu
SRC = gaussian_elimination.f90
EXEC = gaussian_elimination
MODULE = string_to_real.mod
MODF = string_to_real.f90
RM = rm -f
OBJMAIN = gaussian_elimination.o
OBJMOD = string_to_real.o

# Variables so its easy to make changes if I need to (it ended up being helpful)

all: $(EXEC)

$(EXEC): $(SRC) $(MODULE) $(OBJMOD) $(OBJMAIN)
	$(FC) $(OBJMOD) $(OBJMAIN) -o $(EXEC)
	
$(OBJMAIN): $(SRC)
	$(FC) -c $(SRC)

$(MODULE): $(MODF)
	$(FC) -c $(MODF)

clean:
	$(RM) $(OBJMAIN) $(OBJMOD) $(MODULE) $(EXEC)

test: clean $(EXEC)
	./$(EXEC) 3 4 "matrix.txt"
