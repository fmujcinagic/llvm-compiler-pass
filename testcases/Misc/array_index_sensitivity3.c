#include <stdio.h>
#include <string.h>

typedef union {
    char *ptr;
    char buffer[100];
} UnionSimple;

typedef struct {
    UnionSimple u;
    char *safe_ptr;
} Wrapper;

int main() {
    Wrapper w;
    Wrapper *wp = &w;

    fgets(wp->u.buffer, sizeof(wp->u.buffer), stdin);

    wp->safe_ptr = "constant string";
    char temp[100];
    strcpy(temp, wp->u.ptr);  // sink!
    strcpy(temp, wp->safe_ptr);  // this should not be sink!

    return 0;
}
