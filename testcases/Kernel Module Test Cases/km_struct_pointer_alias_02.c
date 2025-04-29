#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

struct Data {
    char data[64];
    char *alias;
};

union km_struct_pointer_alias_02 {
    struct Data obj;
    char *ptr;
};
static union km_struct_pointer_alias_02 km_struct_pointer_alias_02_obj;


static int __init hello_init(void) {
    printk(KERN_INFO "KM: Init\n");
    struct Data obj;
    char *ptr = obj.data;
    copy_from_user(ptr, "user_input", 30);
    km_struct_pointer_alias_02_obj.ptr = ptr;
    strcpy(km_struct_pointer_alias_02_obj.obj.alias, "unsafe");  // sink!
    return 0;
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "exit!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
