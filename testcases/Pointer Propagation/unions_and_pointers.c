#include <stdio.h>
#include <string.h>

union DontTrustThisUnion {
    char *alias;
    char buffer[100];
};

int main() {
    union DontTrustThisUnion critical_union;

    fgets(critical_union.buffer, sizeof(critical_union.buffer), stdin);

    char temp[100];
    strcpy(temp, critical_union.alias);  // sink!

    return 0;
}
