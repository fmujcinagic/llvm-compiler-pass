#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

static int __init hello_init(void) {
    printk(KERN_INFO "hello!\n");
    char buffer[128];
    copy_from_user(buffer, "input", 5);  
    strcpy(buffer, "unsafe");            // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "goodbye!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
