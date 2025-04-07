#include <stdio.h>
#include <string.h>

union Data {
    int number;
    char text[20];
};

int main() {
    union Data data;

    scanf("%d", &data.number);
    
    char destination[20];
    char source[20];
    memcpy(destination, source, data.number); // sink

    strcpy(data.text, "Hello"); // should not be tainted ??


    return 0;
}
