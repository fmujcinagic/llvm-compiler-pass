#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

static int __init hello_init(void) {
    printk(KERN_INFO "KM: mem access using get_user\n");
    char buffer[32];
    int user_val;

    get_user(user_val, (int __user *)buffer);

    if (user_val > 100) {
        printk(KERN_INFO "warning, user_val > 100\n");
    }

    sprintf(buffer, "value: %d", user_val);  // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "KM: Goodbye!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
