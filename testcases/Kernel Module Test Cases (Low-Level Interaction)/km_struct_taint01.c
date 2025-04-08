#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

struct outer {
    char data[32];
};

static int __init hello_init(void) {
    printk(KERN_INFO "access\n");
    struct outer obj;
    char *src = "input";

    copy_from_user(obj.data, src, 20);
    printk(KERN_INFO "KM: Data copied!!\n");

    strcpy(obj.data, "unsafe");  // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "KM: Goodbye!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
