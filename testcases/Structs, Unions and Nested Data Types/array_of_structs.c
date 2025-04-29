#include <stdio.h>
#include <string.h>

struct Item {
    int len;
    char data[20];
};

int main() {
    struct Item items[3];
    scanf("%d", &items[1].len); 

    char dest[20];
    memcpy(dest, items[1].data, items[1].len);  // sink!!
    memcpy(dest, items[0].data, items[0].len);  // should not be flagged

    return 0;
}
