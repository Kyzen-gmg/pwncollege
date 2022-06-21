# file baby_crypt
ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=24af7e68eab982022ea63c1828813c3bfa671b51, for GNU/Linux 3.2.0, not stripped


# checksec baby_crypt                 
[*] '/home/kali/Desktop/reverse_eng/htb_challenges/baby_crypt/baby_crypt'
    Arch:     amd64-64-little
    RELRO:    Full RELRO
    Stack:    Canary found
    NX:       NX enabled

# strings
```
/lib64/ld-linux-x86-64.so.2
mgUa
libc.so.6
__stack_chk_fail
stdin
printf
fgets
malloc
__cxa_finalize
__libc_start_main
GLIBC_2.4
GLIBC_2.2.5
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
u+UH
VUUUH
dH3<%(
[]A\A]A^A_
Give me the key and I'll give you the flag: 
%.26s
:*3$"
GCC: (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.8055
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
src.c
__FRAME_END__
__init_array_end
_DYNAMIC
__init_array_start
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_csu_fini
_ITM_deregisterTMCloneTable
stdin@@GLIBC_2.2.5
_edata
__stack_chk_fail@@GLIBC_2.4
printf@@GLIBC_2.2.5
__libc_start_main@@GLIBC_2.2.5
fgets@@GLIBC_2.2.5
__data_start
__gmon_start__
__dso_handle
_IO_stdin_used
__libc_csu_init
malloc@@GLIBC_2.2.5
__bss_start
main
__TMC_END__
_ITM_registerTMCloneTable
__cxa_finalize@@GLIBC_2.2.5
```

# ltrace

# strace

# ./<file> analysis
//Doesn't seem to be randomized
```
└─# ./baby_crypt      
Give me the key and I'll give you the flag: 1
n5=BG4eF5e5   XRC>
gG

└─# ./baby_crypt 1
Give me the key and I'll give you the flag: 1
n5=BG4eF5e5   XRC>
gG

└─# ./baby_crypt  
Give me the key and I'll give you the flag:    
5d5HGoFo"R"XC

└─# ./baby_crypt
Give me the key and I'll give you the flag: 
5d5HGoFo"R"XC

└─# ./baby_crypt
Give me the key and I'll give you the flag: AAAA
~%tM  D.E.CEBRiOiNAD

└─# ./baby_crypt
Give me the key and I'll give you the flag: BBBB
}&wN
G-F-@FAQjLj▒MBG
```

# Ghidra Import results
```
Project File Name: 	baby_crypt
Last Modified:	Sun Jun 19 10:56:18 EDT 2022
Readonly:	false
Program Name:	baby_crypt
Language ID:	x86:LE:64:default (2.13)
Compiler ID:	gcc
Processor:	x86
Endian:	Little
Address Size:	64
Minimum Address:	00100000
Maximum Address:	_elfSectionHeaders::000007bf
# of Bytes:	8284
# of Memory Blocks:	33
# of Instructions:	20
# of Defined Data:	119
# of Functions:	22
# of Symbols:	58
# of Data Types:	31
# of Data Type Categories:	2
Created With Ghidra Version:	10.1.3
Date Created:	Sun Jun 19 10:56:17 EDT 2022
ELF File Type:	shared object
ELF Original Image Base:	0x0
ELF Prelinked:	false
ELF Required Library [   0]:	libc.so.6
ELF Source File [   0]:	crtstuff.c
ELF Source File [   1]:	src.c
ELF Source File [   2]:	crtstuff.c
ELF Source File [   3]:	
Executable Format:	Executable and Linking Format (ELF)
Executable Location:	/home/kali/Desktop/reverse_eng/htb_challenges/baby_crypt/baby_crypt
Executable MD5:	d018f0fdc9b3d0897739d3d9c5b728fc
Executable SHA256:	1f25b811caa4ab7161c134524a8285f60d38524c428b566f3c0c00275e6265c9
FSRL:	file:///home/kali/Desktop/reverse_eng/htb_challenges/baby_crypt/baby_crypt?MD5=d018f0fdc9b3d0897739d3d9c5b728fc
Relocatable:	true
```
