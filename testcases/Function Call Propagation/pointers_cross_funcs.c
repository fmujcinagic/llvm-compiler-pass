/*
    This testcase is modification of the advanced_aliasing2.c
*/
#include <stdio.h>
#include <string.h>
void modify_through_pointer(int *ptr) {
    int *alias = ptr;  
    scanf("%d", alias);  
}

int* intermediate(int *ptr) {
    return ptr;
}

void wrapper(int *ptr) {
    modify_through_pointer(ptr);
}

int main() {
    int value;
    int *p = &value;

    wrapper(intermediate(p));
    char dest[10];
    char src[10];
    memcpy(dest, src, value);  // sink!
    
    return 0;
}