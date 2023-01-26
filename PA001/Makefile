FLAGS = -O0 -Wextra -Wall -pedantic 

all: main

main: main.c main.h
	gcc $(FLAGS) main.c -o main

clean:
	rm -f main

test:
	make clean
	make

	./main
