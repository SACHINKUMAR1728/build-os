.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern kernelmain
.global loader

loader:
    mov  $kernal_stack,  %esp
    call kernelmain

_stop:
    cli
    hlt
    jmp _stop


.section .bss
.space 2*1024*1024;
kernal_stack:
    