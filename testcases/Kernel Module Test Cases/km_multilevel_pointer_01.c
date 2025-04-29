#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

static int __init hello_init(void) {
    printk(KERN_INFO "Init!\n");
    char buffer[64];
    char *ptr1 = buffer;
    char **ptr2 = &ptr1;
    char ***ptr3 = &ptr2;

    copy_from_user(**ptr3, "user_data", 10);

    strcpy(buffer, **ptr3);  // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "exit!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
