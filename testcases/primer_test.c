#include <stdio.h>

int compute(int x) {
    int y = x * 2;
    return y;
}

int main() {
    int a = 5;
    int b = compute(a);
    printf("Result: %d\n", b);
    return 0;
}
