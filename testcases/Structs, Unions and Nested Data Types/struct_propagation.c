/*
* pass not working for this testcase yet, but its basic idea for struct propagation
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct node {
    int should_be_tainted;
    int should_not_be_tainted_automatically;
};
int main(){
    struct node *n = (struct node *)malloc(sizeof(struct node));
    scanf("%d", &n->should_be_tainted);
    n->should_not_be_tainted_automatically = 10;
    printf("Value of should_be_tainted: %d\n", n->should_be_tainted);
    printf("Value of should_not_be_tainted_automatically: %d\n", n->should_not_be_tainted_automatically);
    char source[20];
    char destination[20];
    strncpy(destination, source, n->should_be_tainted); // sink
    strncpy(destination, source, n->should_not_be_tainted_automatically); // not a sink! // TODO: This has to be fixed
    return 0;
}