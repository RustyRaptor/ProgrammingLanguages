/*
Ziad Arafat
Febuary 1 2023
Input: None
Output: Prints my name to the stdout
preconditions: None
postconditions: My name will be printed on the stdout

*/

#include "main.h"


/*
Main function will call my_name_array() and cast it's integer array to a char
array and pass that to a printf() so it displays the string. 
*/
int main()
{

    // cast the returned array to a char pointer and pass it to printf
    printf((char *)my_name_array());

    printf("\n"); // print a new line



}

/*
Generate my name as a int array.
Each int will store 4 chars in little endian form.

PRE: None
POST: Return will be an integer pointer to a new array containing the correct bytes 
to represent Ziad Arafat in ascii and stored in Little Endian format.

Returns: Integer pointer to a new array containing the correct bytes 
to represent Ziad Arafat in ascii and stored in Little Endian format. 
*/
int* my_name_array() {
    int *name_arr = (int *)malloc(11);

    name_arr[0] = 0x6461695a; // Z,i,a,d -> d,a,i,Z
    name_arr[1] = 0x61724120; //  ,A,r,a -> a,r,A,  
    name_arr[2] = 0x746166;   // f,a,t   -> t,a,f
    name_arr[3] = 0;          // END String

    return name_arr;
}

