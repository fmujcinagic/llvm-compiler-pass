#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

struct tainted_data {
    char data[64];
};

static char* get_tainted_data(char *buffer) {
    char *tainted = kmalloc(64, GFP_KERNEL);
    if (!tainted) {
        return NULL;
    }
    strcpy(tainted, buffer);  // sink!
    return tainted;
}

static void process_input(struct tainted_data *td) {
    char intermediate[64];
    strcpy(intermediate, td->data);
    printk(KERN_INFO "KM: Processing tainted data: %s\n", intermediate);
}

static void handle_data(char *data) {
    struct tainted_data td;
    strcpy(td.data, data);  // sink!
    process_input(&td);
}

static int __init complex_init(void) {
    printk(KERN_INFO "KM: km_function_taint02\n");
    char buffer[64];

    copy_from_user(buffer, "user_input", 20);

    char *tainted = get_tainted_data(buffer);
    if (tainted) {
        handle_data(tainted);
        kfree(tainted);
    }
    return 0;
}

static void __exit complex_exit(void) {
    printk(KERN_INFO "KM: exit\n");
}

module_init(complex_init);
module_exit(complex_exit);

MODULE_LICENSE("GPL");