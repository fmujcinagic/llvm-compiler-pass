#include <stdio.h>
#include <string.h>

char *rec(int n, char *p) {
    if (n == 0)
    {
        return p;
    }
    return rec(n - 1, p);    
}

int main() {
    char buf[24];
    scanf("%23s", buf);      
    char *out = rec(4, buf); 
    char copy[24];
    strcpy(copy, out);         // sink!
    return 0;
}
