#include "main.h"

int main()
{

    // cast the returned array to a char pointer and pass it to printf
    printf((char *)my_name_array());


    printf("\n"); // print a new line



}

/*
Generate my name as a int array.
Each int will store 4 chars in little endian form.
*/
int* my_name_array() {
    int *name_arr = (int *)malloc(11);

    name_arr[0] = 0x6461695a; // Z,I,A,D -> D,A,I,Z
    name_arr[1] = 0x61724120; //  ,A,R,A -> A,R,A,  
    name_arr[2] = 0x746166;   // F,A,T   -> T,A,F
    name_arr[3] = 0;          // END String

    return name_arr;
}

