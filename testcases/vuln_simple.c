#include <stdio.h>
#include <string.h>

int main() {
    int x;
    scanf("%d", &x);
    int new_tainted_x = x;
    printf("Now printing tainted stuff: %d\n", new_tainted_x);

    char source[8];
    char destination[8];
    memcpy(destination, source, new_tainted_x); // dangerous, using tainted size in memcpy
    return 0;
}
