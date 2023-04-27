red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Variables so its easy to make changes if I need to (it ended up being helpful)

all: test

test: pa008/App.java pa008/Natural.java
	@echo "${green} Building and executing Java code ${reset}"
	javac -cp pa008/ pa008/*java
	java -cp . pa008/App

run_ada: grade_distribution.adb
	@echo "${green} Building and executing Ada code ${reset}"
	gcc -c grade_distribution.adb
	gnatbind grade_distribution
	gnatlink grade_distribution
	./grade_distribution

clean:
	rm -rf *.o
	rm -rf *.ali
	rm -rf grade_distribution
	rm -rf pa008/*.class