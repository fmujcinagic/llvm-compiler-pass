#include <stdio.h>
#include <string.h>

struct AnotherStruct {
    char buf[50];
    int len;
};

int main() {
    struct AnotherStruct another_struct_instance;
    scanf("%d", &another_struct_instance.len);

    char out[50];
    memcpy(out, another_struct_instance.buf, another_struct_instance.len);  // sink!!

    return 0;
}
