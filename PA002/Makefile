FLAGS = -O0 -Wextra -Wall -pedantic -c

all: main_ada main_bash main_php main_perl

main_ada: main_ada.adb
	# Running Ada Code
	gcc -c main_ada.adb
	gnatmake --GNATBIND=gnatbind --GNATLINK=gnatlink main_ada
	./main_ada
	# =====================

main_bash: main_bash.sh
	# Running Bash Code
	bash main_bash.sh
	# =====================

main_php: main_php.php
	# Running PHP Code
	php main_php.php
	# =====================
main_perl: main_perl.pl
	# Running PHP Code
	perl main_perl.pl
	# =====================

clean:
	rm -f main_ada main_ada.o main_ada.ali

test:
	make clean
	make

	./main
