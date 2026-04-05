#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xd4733cff, "module_layout" },
	{ 0x6bc3fbc0, "__unregister_chrdev" },
	{ 0x1fedf0f4, "__request_region" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0x9b388444, "get_zeroed_page" },
	{ 0xc996d097, "del_timer" },
	{ 0x86d5255f, "_raw_write_lock_irqsave" },
	{ 0xb2ba53eb, "dev_set_drvdata" },
	{ 0xc8b57c27, "autoremove_wake_function" },
	{ 0x62c1ade7, "malloc_sizes" },
	{ 0x3a013b7d, "remove_wait_queue" },
	{ 0x8a276b7a, "alloc_tty_driver" },
	{ 0xea5578d5, "pci_disable_device" },
	{ 0xe104ce00, "tty_hung_up_p" },
	{ 0x9396a431, "no_llseek" },
	{ 0x62cb4cee, "interruptible_sleep_on" },
	{ 0x2addc0be, "down_interruptible" },
	{ 0x5792fc3, "device_destroy" },
	{ 0x112acbc6, "__register_chrdev" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0x9cfad376, "tty_register_driver" },
	{ 0xfb0e29f, "init_timer_key" },
	{ 0xcc99e735, "mutex_unlock" },
	{ 0xc89b864b, "put_tty_driver" },
	{ 0x91715312, "sprintf" },
	{ 0x7d11c268, "jiffies" },
	{ 0xe8d2bdc2, "tty_set_operations" },
	{ 0x168f1082, "_raw_write_unlock_irqrestore" },
	{ 0x48eb0c0d, "__init_waitqueue_head" },
	{ 0xffd5a395, "default_wake_function" },
	{ 0xff7559e4, "ioport_resource" },
	{ 0xf97456ea, "_raw_spin_unlock_irqrestore" },
	{ 0x95435001, "current_task" },
	{ 0x1cf19dfd, "do_SAK" },
	{ 0xdd3afd66, "mutex_lock_interruptible" },
	{ 0xce65a0a8, "__mutex_init" },
	{ 0x50eedeb8, "printk" },
	{ 0x4141f80, "__tracepoint_module_get" },
	{ 0xfaef0ed, "__tasklet_schedule" },
	{ 0xa1c76e0a, "_cond_resched" },
	{ 0x2da418b5, "copy_to_user" },
	{ 0xdd1a2871, "down" },
	{ 0x9545af6d, "tasklet_init" },
	{ 0x71abefe1, "device_create" },
	{ 0x8834396c, "mod_timer" },
	{ 0xbe2c0274, "add_timer" },
	{ 0xd6b8e852, "request_threaded_irq" },
	{ 0x84d78353, "tty_insert_flip_string_flags" },
	{ 0xe523ad75, "synchronize_irq" },
	{ 0x82072614, "tasklet_kill" },
	{ 0xebebf1d1, "module_put" },
	{ 0xc6cbbc89, "capable" },
	{ 0x8ff4079b, "pv_irq_ops" },
	{ 0x67b27ec1, "tty_std_termios" },
	{ 0xb2fd5ceb, "__put_user_4" },
	{ 0x253e9f6a, "tty_wait_until_sent" },
	{ 0x823ab0bb, "pci_bus_read_config_word" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0x3bd1b1f6, "msecs_to_jiffies" },
	{ 0xd62c833f, "schedule_timeout" },
	{ 0x4292364c, "schedule" },
	{ 0xf1faac3a, "_raw_spin_lock_irq" },
	{ 0x7c61340c, "__release_region" },
	{ 0xfc8cc9a9, "pci_unregister_driver" },
	{ 0x6fe340df, "kmem_cache_alloc_trace" },
	{ 0x67f7403e, "_raw_spin_lock" },
	{ 0x21fb443e, "_raw_spin_lock_irqsave" },
	{ 0x97cd8354, "tty_unregister_driver" },
	{ 0x83c2c601, "tty_hangup" },
	{ 0x4302d0eb, "free_pages" },
	{ 0xe45f60d8, "__wake_up" },
	{ 0xd7bd3af2, "add_wait_queue" },
	{ 0x83800bfa, "kref_init" },
	{ 0x9c55cec, "schedule_timeout_interruptible" },
	{ 0x37a0cba, "kfree" },
	{ 0x622fa02a, "prepare_to_wait" },
	{ 0xc4554217, "up" },
	{ 0x7e79192d, "__pci_register_driver" },
	{ 0xd13b2b18, "class_destroy" },
	{ 0xb7073b71, "pci_get_device" },
	{ 0x75bb675a, "finish_wait" },
	{ 0x12dad672, "tty_flip_buffer_push" },
	{ 0xdb49d31, "pci_enable_device" },
	{ 0x33d169c9, "_copy_from_user" },
	{ 0x1df70be4, "__class_create" },
	{ 0x74f13e03, "dev_get_drvdata" },
	{ 0xf20dabd8, "free_irq" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00009999bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004027bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00005027bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004037bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00005037bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00000002bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004056bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00006056bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004055bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004066bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00005066bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00008138bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00009138bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00008156bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00009156bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00008166bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00009166bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00005079bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004089bc*sc*i*");
MODULE_ALIAS("pci:v00001409d00007168sv00001409sd00004096bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00001002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00001004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00001008bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00001016bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00002002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00002004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00002008bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00003002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00003004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00000001sv00000001sd00003008bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000001bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000008bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000010bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000101bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000102bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000104bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000100bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000008bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000010bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000084bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000088bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000002bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000004bc*sc*i*");
MODULE_ALIAS("pci:v00001FD4d00001999sv00001FD4sd00000004bc*sc*i*");
