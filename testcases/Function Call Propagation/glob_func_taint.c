#include <stdio.h>
#include <string.h>

char *g;

void producer(void) {
    static char local[32];
    scanf("%s", local);
    g = local;           
}

int main() {
    producer();
    char dst[32];
    strcpy(dst, g);        // sink!
    return 0;
}
