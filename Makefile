KRELEASE ?= $(shell uname -r)
KBUILD ?= /lib/modules/$(KRELEASE)/build
obj-m := it87_wdt.o

modules:
	$(MAKE) -C $(KBUILD) M=$(PWD) modules

install: modules
	/usr/bin/install -m 644 -D it87_wdt.ko /lib/modules/$(KRELEASE)/kernel/drivers/watchdog/it87_wdt.ko
	/usr/bin/install -m 644 -D it87_wdt.conf /usr/lib/modules-load.d/it87_wdt.conf

clean:
	$(MAKE) -C $(KBUILD) M=$(PWD) clean
