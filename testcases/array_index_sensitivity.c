#include <stdio.h>
#include <string.h>

int main() {
    int data[5];      
    int safe_var = 0; 
    int target[5];    

    scanf("%d", &data[2]);   // only the third element (index 2) is tainted

    int non_tainted_element = data[0];

    memcpy(&target[2], &data[2], sizeof(int));  // sink

    memcpy(&target[0], &data[0], sizeof(int));  // should not be flagged

    memcpy(target, data, sizeof(data));  // Bulk copy - should be flagged if taint is propagated to the entire array

    return 0;
}