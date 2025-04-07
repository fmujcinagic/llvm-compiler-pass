#include <stdio.h>
#include <string.h>

void process(char *ptr) {
    char temp[100];
    strcpy(temp, ptr);  // sink!!
}

int main() {
    char buffer1[50];
    char *alias1;
    char **alias2;
    fgets(buffer1, sizeof(buffer1), stdin);

    alias1 = buffer1;    // first level alias
    alias2 = &alias1;    // second level alias

    strcpy(buffer1, alias1);

    process(*alias2);   // indirect alias here

    return 0;
}
