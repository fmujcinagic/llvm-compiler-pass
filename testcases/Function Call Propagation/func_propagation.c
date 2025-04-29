#include <stdio.h>
#include <string.h>

void third_final_vuln(char *input) {
    char buffer[20];
    strcpy(buffer, input); // sink!
}

void process(char *input) {
    third_final_vuln(input);
}

int main() {
    char user_input[50];
    scanf("%s", user_input);
    process(user_input);
    return 0;
}
