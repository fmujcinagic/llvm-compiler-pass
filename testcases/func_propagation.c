#include <stdio.h>
#include <string.h>

void process(char *input) {
    char buffer[20];
    strcpy(buffer, input);
}

int main() {
    char user_input[50];
    scanf("%49s", user_input);
    process(user_input);
    return 0;
}
