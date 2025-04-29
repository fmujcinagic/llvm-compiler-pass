#include <stdio.h>
#include <string.h>

char *echo(char *msg) {        
    return msg;                
}

int main() {
    char user[40];
    scanf("%39s", user);      
    char *copy = echo(user);  
    char target[40];
    strcpy(target, copy);      // sink!
    return 0;
}
