red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Variables so its easy to make changes if I need to (it ended up being helpful)

all: test
test: concurrency.py
	@echo "${green}For N = 4${reset}"
	python3 concurrency.py 4
	@echo "${green}For N = 8${reset}"
	python3 concurrency.py 8
	@echo "${green}For N = 16${reset}"
	python3 concurrency.py 16
