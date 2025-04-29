#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

static int __init hello_init(void) {
    printk(KERN_INFO "KM: Pointer alias handling\n");
    char buffer[64];
    char *ptr = buffer;
    char **alias = &ptr;

    copy_from_user(*alias, "user_input", 10);

    printk(KERN_INFO "KM: Data: %s\n", *alias);

    strcpy(ptr, "unsafe");  // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "KM: Goodbye!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
