#include <stdio.h>
#include <string.h>

void printTainted(char *buff) {
    printf("Tainted: %s\n", buff);
}

void vuln(char *tainted_input) {
    char buffer_thats_to_be_tainted[10];
    strcpy(buffer_thats_to_be_tainted, tainted_input);
    printf("%s\n", buffer_thats_to_be_tainted);
    printTainted(buffer_thats_to_be_tainted);
}

int main() {
    char input[20];
    scanf("%19s", input);                   
    vuln(input);
    return 0;
}
