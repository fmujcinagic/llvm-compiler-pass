#include <stdio.h>
#include <string.h>

char *get_user() {      
    static char buf[64];
    scanf("%63s", buf);
    return buf;        
}

int main() {
    char *data = get_user();   // CallInst tainted
    char dst[64];
    strcpy(dst, data);         // sink!
    return 0;
}
