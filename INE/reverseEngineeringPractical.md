Practical Reverse Engineering

# String References and Basic Patching
By string reference, we mean an assemblu instruction that refers to a memory location where a string is stored.

## Patching
1. Replace with NOPs (0x90)
```
0x00402E76  75 1F       JNZ 00402E97
0x00402E76  90 90       JNZ 00402E97    //nops added
```
2. Invert the logic of the jump
```
0x00402E76  75 1F       JNZ 00402E97
0x00402E76  74 1F       JZ 00402E97     //inverted
```
3. Nullify the effect of the redirect
```
0x00402E76  75 1F       JNZ 00402E97
0x00402E76  74 00       JZ 00402E97     //num of bytes for the jump changed to 0
```

## Offset Manual Calculation
(In Ollydbg)
Select Byte
Alt+m
RightClick, Dump in CPU
Find size of related section:

VirtualSize: The size of the section in mem
VirtualAddress: The RVA of the section in memory, not the VA
SizeofRawData: Size of the section in the file
PointerToRawData: Starting offset of the section in the file
```
0x00400000 Start
0x0023A000 Size
```
Calculation to find offset of the byte to patch using the following formula:

Byte_offset = Byte_VA - (Image_base + Section_RVA) + PointerToRawData
0x00402E77 - (0x400000 + 0x1000) + 0x600 = 0x2477

Open HexEditor
Ctrl+g
Save to new binary

## lab
"A-jOuRneY-0f-A-th0usaNd-Mil3s-Mu5t-B3g1n-With-A-5inGl3-St3p"

# Exploring the Stack

## lab
"Fr0m-sma11-b3g1nn1ng5-c0m3-grea7-th1ng5"

# Algorithm Reversing
Set breakpoints on both the instruction that pushes the param to the func as well as to the CALL instruction

We could've just placed the brkpt on the CALL instructions, but we wanted to break first on the prev instruction in order to eval the param *before* it is pushed onto the stack.

This is not generally necessary since we can eval the param also once pushed onto the stack, but it shows you in more detail how the exec is progressing.

## Algo 1: String Decryption/Encryption
Algo that's no longer based on a hardcoded string, but evaluated the code based on specific logic.

## Algo 2: Code Validation



# Windows Registry Manipulation


# File Manipulation


# Anti-Reversing Tricks: Part 1


# Anti-Reversing Tricks: Part 2


# Anti-Reversing Tricks: Part 3


# Code Obfuscation


# Analyzing Packers and Manual Upacking


# Debugging Multi-Thread Applications
