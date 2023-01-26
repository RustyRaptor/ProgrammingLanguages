#include <stdio.h>
#include <stdlib.h>

int* myNameArray() {
    int *name_arr = (int *)malloc(11);

    name_arr[0] = 0x6461695a;
    name_arr[1] = 0x61724120;
    name_arr[2] = 0x746166;
    name_arr[3] = 0;

    return name_arr;
}