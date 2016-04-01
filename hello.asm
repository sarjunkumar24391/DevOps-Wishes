; this is especially thanks to:
; http://web.archive.org/web/20140528193301/http://blog.markloiseau.com/2012/05/tiny-64-bit-elf-executables

BITS 64
	org	0x00400000	; Program load offset

; 64-bit ELF header
ehdr:
	;  1), 0 (ABI ver.)
	db 0x7F, "ELF", 2, 1, 1, 0       ; e_ident
	times 8 db 0                     ; reserved (zeroes)

	dw 2              ; e_type:	Executable file
	dw 0x3e           ; e_machine:	AMD64
	dd 1              ; e_version:	current version
	dq _start         ; e_entry:	program entry address (0x78)
	dq phdr - $$      ; e_phoff	program header offset (0x40)
	dq 0              ; e_shoff	no section headers
	dd 0              ; e_flags	no flags
	dw ehdrsize       ; e_ehsize:	ELF header size (0x40)
	dw phdrsize       ; e_phentsize:	program header size (0x38)
	dw 1              ; e_phnum:	one program header
	dw 0              ; e_shentsize
	dw 0              ; e_shnum
	dw 0              ; e_shstrndx

ehdrsize equ $ - ehdr

; 64-bit ELF program header
phdr:
	dd 1              ; p_type:	loadable segment
	dd 5              ; p_flags	read and execute
	dq 0              ; p_offset
	dq $$             ; p_vaddr:	start of the current section
	dq $$             ; p_paddr:	"		"
	dq filesize       ; p_filesz
	dq filesize       ; p_memsz
	dq 0x200000       ; p_align:	2^11=200000 = section alignment

; program header size
phdrsize equ $ - phdr

; Hello World!/your program here
_start:

	; sys_write(stdout, message, length)
	mov	rax, 1           ; sys_write
	mov	rdi, 1           ; stdout
	mov	rsi, message     ; message address
	mov	rdx, length      ; message string length
	syscall

	; sys_exit(return_code)
	mov	rax, 60          ; sys_exit
	mov	rdi, 0           ; return 0 (success)
	syscall

	message:
		db 0x0A
		db 'Hello Boss.', 0x0A
		db 'Thought of different ideas to convey "Happy and Safe Journey".', 0x0A
		db 0x0A
		db 'But asusual.... no plans came or ideas striked my empty mind', 0x0A
		db ' So suddenly thought of something innovative through which i can ', 0x0A
		db ' convey my wishes as well as the knowledge gained because of your help and', 0x0A
		db ' support', 0x0A
		db '    "HAPPY AND SAFE JOURNEY"', 0x0A
		db ' Come back with good and happy memories and share with us', 0x0A
		db ' and we are wishing you happy holidays during the weekends in Amsterdam :0)', 0x0A
		db 0x0A
		db 'With Best Regards,', 0x0A
		db 'Arjun', 0x0A
		db 'Siddharth', 0x0A
		db 'Christy', 0x0A
		db 0x0A
		db '"ENJOY ENJOY ENJOY"', 0x0A
		db '', 0x0A
		db 0x0A
	length: equ	$-message            ; message length calculation

; File size calculation
filesize equ $ - $$
