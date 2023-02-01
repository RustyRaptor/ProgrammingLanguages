/*
Ziad Arafat
Febuary 1 2023
Input: None
Output: Prints my name to the stdout
preconditions: None
postconditions: My name will be printed on the stdout
*/

#include <stdio.h>
#include <stdlib.h>

/*
Generate my name as a int array.
Each int will store 4 chars in little endian form.

PRE: None
POST: Return will be an integer pointer to a new array containing the correct bytes 
to represent Ziad Arafat in ascii and stored in Little Endian format.

Returns: Integer pointer to a new array containing the correct bytes 
to represent Ziad Arafat in ascii and stored in Little Endian format. 
*/
int* my_name_array();