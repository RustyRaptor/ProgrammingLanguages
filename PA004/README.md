
## Usage

### Testing each language
1. setup the perl dependency
```bash
make
```
or
```bash
make setup_perl
```

2. run all the tests. This will print the result of each language then print the original file. 

```bash
make test
```

3. Run individual tests
```bash
make test_python
make test_perl
make test_java
```

4. Delete output files

```bash
make clean
```

### Executing The python program
1. Usage
```bash
# Only the input file path is a required positional argument. 
# If the output is left out it will print it to stdout
usage: clean_file.py [-h] [-o OUTPUT_FILE_PATH] input_file_path
```
2. Examples

```bash
python3 clean_file.py test.txt
python3 clean_file.py test.txt -o out.txt
```

### Executing The perl program
1. Usage
```bash
# Only the input file path is a required argument. 
# If the output is left out it will print it to stdout
Usage: clean_file.pl --input_file_path INPUT_FILE_PATH [--output_file_path OUTPUT_FILE_PATH]

```
2. Examples

```
perl clean_file.pl --input_file_path test.txt
perl clean_file.pl --input_file_path test.txt --output_file_path out.txt
```

### Executing The java program
1. Usage
```bash
# Only the input file path is a required positional argument. 
# If the output is left out it will print it to stdout
Usage: CleanFile <input_file_path> [<output_file_path>]

```
2. Examples

```
java CleanFile.java test.txt
java CleanFile.java test.txt out.txt
```

