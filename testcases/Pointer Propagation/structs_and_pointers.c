#include <stdio.h>
#include <string.h>

typedef struct {
    char *buf;
} Wrapper;

int main() {
    char input[100];
    fgets(input, sizeof(input), stdin);

    Wrapper bw;
    bw.buf = input;

    char temp[100];
    strcpy(temp, bw.buf);  // sink!

    return 0;
}
