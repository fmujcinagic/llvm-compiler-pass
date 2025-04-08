#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/uaccess.h>

struct complex_data {
    char sensitive[64];
    char auxiliary[32];
    int flag;
};

static struct complex_data* allocate_struct(void) {
    struct complex_data *cd = kmalloc(sizeof(struct complex_data), GFP_KERNEL);
    if (!cd) {
        return NULL;
    }
    memset(cd->sensitive, 0, 64);
    memset(cd->auxiliary, 0, 32);
    cd->flag = 0;
    return cd;
}

static void manipulate_data(struct complex_data *cd, char *input) {
    strncpy(cd->sensitive, input, 63);
    cd->flag = strlen(input);
}

static void process_complex(struct complex_data *cd) {
    char intermediate[128];
    snprintf(intermediate, 128, "[Sensitive]: %s [Auxiliary]: %s", cd->sensitive, cd->auxiliary);
}

static int __init advanced_init(void) {
    printk(KERN_INFO "KM: km_function_taint03\n");
    char user_buffer[64];

    copy_from_user(user_buffer, "user_input_advanced", 20);

    struct complex_data *cd = allocate_struct();
    if (cd) {
        manipulate_data(cd, user_buffer);  
        strncpy(cd->auxiliary, "Static Helper Data", 31);  
        process_complex(cd);  
        kfree(cd);
    }
    return 0;
}

static void __exit advanced_exit(void) {
    printk(KERN_INFO "KM: exit\n");
}

module_init(advanced_init);
module_exit(advanced_exit);

MODULE_LICENSE("GPL");
