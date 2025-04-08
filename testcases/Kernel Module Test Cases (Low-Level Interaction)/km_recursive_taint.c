#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

void recursive_process(char *data, int depth) {
    if (depth <= 0) return;
    recursive_process(data, depth - 1);
    if (depth == 1) {
        char buffer[32];
        strcpy(buffer, data);  // sink!
        printk(KERN_INFO "KM: Final recursion data: %s\n", buffer);
    }
}

static int __init hello_init(void) {
    printk(KERN_INFO "KM: reucrsion starts\n");
    char buffer[64];
    copy_from_user(buffer, "input_data", 20);
    recursive_process(buffer, 10);
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "finished!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
