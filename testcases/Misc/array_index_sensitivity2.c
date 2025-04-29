#include <stdio.h>
#include <string.h>

int main() {
    int data[5] = {0};     
    int target[5] = {0};   
    scanf("%d", &data[3]);

    memcpy(&target[3], &data[3], sizeof(int)); //sink!
    memcpy(&target[1], &data[1], sizeof(int));  // should NOT be flagged

    return 0;
}
