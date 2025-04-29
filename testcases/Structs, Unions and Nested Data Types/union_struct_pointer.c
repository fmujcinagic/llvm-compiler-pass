#include <stdio.h>
#include <string.h>
#include <stdlib.h>
union U {
    int len;
    char buf[100];
};

struct Wrapper {
    union U u;
};

int main() {
    struct Wrapper *w = (struct Wrapper *)malloc(sizeof(struct Wrapper));
    scanf("%d", &w->u.len);

    char src[100], dest[100];
    memcpy(dest, src, w->u.len);  // sink!!!

    return 0;
}
