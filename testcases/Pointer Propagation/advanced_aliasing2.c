#include <stdio.h>
#include <string.h>

void modify_through_pointer(int *ptr) {
    int *alias = ptr;  
    scanf("%d", alias);  
}

int main() {
    int value;
    int *p = &value;
    
    modify_through_pointer(p);
    char dest[10];
    char src[10];
    memcpy(dest, src, value);  // sink!
    
    return 0;
}