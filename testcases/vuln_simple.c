#include <stdio.h>
#include <string.h>

int main() {
    int x;
    scanf("%d", &x);
    int new_tainted_x = x;
    printf("Now printing tainted stuff: %d\n", new_tainted_x);
    return 0;
}
