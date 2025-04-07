#include <stdio.h>
#include <string.h>

int main() {
    char buffer1[50];
    char *alias;
    fgets(buffer1, sizeof(buffer1), stdin);  

    alias = buffer1;

    // char dest[50];
    strcpy(buffer1, alias);  // sink!!

    return 0;
}
