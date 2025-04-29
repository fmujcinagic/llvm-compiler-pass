#include <stdio.h>
#include <string.h>

struct Inner {
    int len;
};

struct Outer {
    struct Inner inner;
    char buffer[100];
};

int main() {
    struct Outer obj;
    scanf("%d", &obj.inner.len); 

    char dest[100];
    memcpy(dest, obj.buffer, obj.inner.len);  // sink!!!

    return 0;
}
