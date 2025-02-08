GPPARAMS  = -m32
ASPARAMS = --32
OBJS = kernal.o loader.o
LDPARAMS = -m elf_i386
%.o %.cpp
	g++  $(GPPARAMS) -C $< -o $@
%.0 %.s
	g++  $(ASPARAMS) -S $< -o $@

mykernal.bin: linker.ld $(OBJS) 
	ld $(LDPARAMS) -T $< -o $@ $(OBJS)

install: mykernal.bin
	sudo cp $< /boot/mykernal.bin