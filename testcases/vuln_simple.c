#include <stdio.h>
#include <string.h>

int vuln() {
    int x;
    printf("User could enter anything, right?\n");
    scanf("%d", &x);
    return x;
}

int main() {
    int x;
    scanf("%d", &x);
    int new_x = x + 26;
    printf("Now printing new_x: %d\n", new_x);
    // int new_tainted_x = x;
    // printf("Now printing tainted stuff: %d\n", new_tainted_x);

    char source[8];
    char destination[8];
    memcpy(destination, source, new_x); // dangerous, using tainted size in memcpy

    int tainted_y = vuln();
    char source2[8];
    char destination2[8];
    memcpy(destination2, source2, tainted_y); // dangerous, using tainted size in memcpy

    return 0;
}
