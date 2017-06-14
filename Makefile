LIBS+= -L${FF_PATH}/lib -L${FF_DPDK}/lib -Wl,--whole-archive,-lfstack,--no-whole-archive
LIBS+= -Wl,--whole-archive -lrte_pmd_vmxnet3_uio -lrte_pmd_i40e -lrte_pmd_ixgbe -lrte_pmd_e1000 -lrte_pmd_ring
LIBS+= -Wl,--whole-archive -lrte_hash -lrte_kvargs -Wl,-lrte_mbuf -lethdev -lrte_eal -Wl,-lrte_mempool
LIBS+= -lrte_ring -lrte_cmdline -lrte_cfgfile -lrte_kni -lrte_timer -Wl,-lrte_pmd_virtio
LIBS+= -Wl,--no-whole-archive -lrt -lm -ldl -lcrypto -pthread

TARGET=libffsyscall.a
all:
	@ if [ -z $$FF_PATH ]; then echo FF_PATH not set ; exit 1; fi
	@ if [ -z $$FF_DPDK ]; then echo FF_DPDK not set ; exit 1; fi

	cc -O -gdwarf-2 -c -I ${FF_PATH}/lib -o ff_syscall.o ff_syscall.c ${LIBS}
	ar rcs ${TARGET} ff_syscall.o


.PHONY: clean
clean:
	rm -f *.o ${TARGET}
