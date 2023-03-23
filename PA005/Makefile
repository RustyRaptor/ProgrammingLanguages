red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Variables so its easy to make changes if I need to (it ended up being helpful)

all: setup_perl

setup_perl:
	cpan File::Slurp

test: test_python test_perl test_java
	@echo "${green}###### ORIGINAL FILE ######${reset}"
	cat test.txt

test_python: out_python.txt
	@echo "${green}###### PYTHON RESULT ######${reset}"
	@cat out_python.txt

test_perl: out_perl.txt
	@echo "${green}###### PERL RESULT ######${reset}"
	@cat out_perl.txt

test_java: out_java.txt
	@echo "${green}###### JAVA RESULT ######${reset}"
	@cat out_java.txt
		

out_python.txt: test.txt
	python3 clean_file.py test.txt -o out_python.txt

out_perl.txt: test.txt
	perl clean_file.pl --input_file_path test.txt --output_file_path out_perl.txt

out_java.txt: test.txt
	java CleanFile.java test.txt out_java.txt

clean:
	rm -rf out_java.txt out_python.txt out_perl.txt
