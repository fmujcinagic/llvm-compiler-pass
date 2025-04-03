#include <stdio.h>
#include <string.h>

struct Data {
    int length;
    char buffer[100];
};

int main() {
    struct Data data;
    struct Data *ptr = &data;

    printf("Enter length: ");
    scanf("%d", &ptr->length);   
    data.length = ptr->length;   

    char destination[50];
    memcpy(destination, data.buffer, data.length);  // sink 
    strncpy(ptr->buffer, "Hello", data.length); // sink

    return 0;
}
