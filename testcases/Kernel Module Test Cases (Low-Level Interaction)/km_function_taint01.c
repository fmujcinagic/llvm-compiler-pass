#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

static void process_input(char *buffer) {
    char temp[64];
    strcpy(temp, buffer);  // sink!
}

static int __init hello_init(void) {
    printk(KERN_INFO "KM: Taint through function call\n");
    char buffer[64];

    copy_from_user(buffer, "input", 20);

    process_input(buffer); // simple function propagation
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "KM: Goodbye!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
