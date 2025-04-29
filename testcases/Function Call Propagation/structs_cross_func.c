#include <stdio.h>
#include <string.h>

struct packet { char data[32]; };

void sender(struct packet *p)
{
    scanf("%s", p->data);           
}

void rec(struct packet *p)
{
    char buf[32];
    strcpy(buf, p->data);                  // sink!
}

int main(void)
{
    struct packet p;
    sender(&p);
    rec(&p);
    return 0;
}
