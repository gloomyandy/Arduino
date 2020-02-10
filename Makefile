
all: lwip core

core:
	make -f makefiles/Makefile.build-core \
		TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
		LIB_RELEASE=build/libCoreESP8266.a \
		BUILD=build NONO=NONOSDK2VX \
		all ; 
	make -f makefiles/Makefile.build-core \
		TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
		LIB_RELEASE=build/libCoreESP8266V3.a \
		BUILD=build NONO=NONOSDK3V0 \
		all ; 

lwip: patch
	make -C tools/sdk/lwip2 -f Makefile all


clean: clean-patch
	make -C tools/sdk/lwip2 -f Makefile $@
	make -f makefiles/Makefile.build-core \
                TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
                LIB_RELEASE=build/libCoreESP8266.a \
                BUILD=build NONO=NONOSDK2VX\
                $@ ; 
	make -f makefiles/Makefile.build-core \
                TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
                LIB_RELEASE=build/libCoreESP8266V3.a \
                BUILD=build NONO=NONOSDK3V0\
                $@ ; 

install: patch
	make -C tools/sdk/lwip2 -f Makefile $@
	make -f makefiles/Makefile.build-core \
                TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
                LIB_RELEASE=build/libCoreESP8266.a \
                BUILD=build NONO=NONOSDK2VX\
                $@ ; 
	make -f makefiles/Makefile.build-core \
                TOOLS=tools/xtensa-lx106-elf/bin/xtensa-lx106-elf- \
                LIB_RELEASE=build/libCoreESP8266V3.a \
                BUILD=build NONO=NONOSDK3V0\
                $@ ; 

patch: makefiles/.patched

makefiles/.patched:
	patch -d tools/sdk/lwip2/builder -p1 < makefiles/duetwifi-lwip2.patch
	touch makefiles/.patched

clean-patch:
	rm -f makefiles/.patched
	cd tools/sdk/lwip2/builder; rm -f makefiles/*.orig; git checkout makefiles

