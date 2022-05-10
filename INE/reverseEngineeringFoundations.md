# The Necessary Theory: Part 1
EAX - Accumulator for operands and results data  
EBX - Pointer to data in the DS segment  
ECX - Counter for string and loop operations  
EDX - I/O pointer  
ESI - Pointer to data in the segment pointed to by the DS register; source pointer for string operations  
EDI - Pointer to data (or destination) in the segment pointed to by the ES register; destination pointer for string operations  
ESP - Stack Pointer (in the SS Segment)  
EBP - Pointer to data on the stack (in the SS segment)  

```
Intel IA-32 Chunks of General-Purpose Registers  

31           16 15       8 7         0
                    AH          AL
                    BH          BL
                    CH          CL
                    DH          DL
                          BP
                          SI
                          DI
                          SP
```

EAX     Freezer  
AH      Condiments Fridge  
AL      Main Fridge  

EBX     Microwave  
BH      Stove top  
BL      Oven  

ECX     Left Sink  
CH      Right Sink  
CL      Dishwasher  

EDX     Glasses Cabinet  
DH      Countertop  
DL      Bottom Cabinet  

EBP     Monitor  
BP      Work Desk  

ESI     Couch  
SI      Window sill  

EDI     Next to Pikachu  
DI      Cubby hole  

ESP     Top of TV  
SP      TV Screen  

## EFLAGS Register
DF = Control flag for string processing.  

If DF=1, the string instructions will auto-decrement.  
std (set direction flag) is used to set DF to 1
    
If DF=0, the string instructions will auto-increment.  
cld (clear direction flag) is used to set DF to 0

## Segment Registers
Contains special pointers called segment selectors that identify the different types of segments in memory.
```
CS --|       Linear Address Space for Program
DS --|       ____________   Overlapping segments
SS --|       |          |   of up to 4gbytes
ES --|       |          |   beginning at Address 0
FS --|       |          |
GS --|_______|__________|
```
**CS** register contains the segment selector for the code segment  
**SS** register points to the stack segment, where the stack of the current thread under execution is stored in memory. All stack-related ops use the SS register to located the stack segment.  
**DS, ES, FS, GS** registers point to four different data segments, which are used to store different types of data structures or single variables

## EIP
Instruction Pointer Register, also called the Program Counter (PC) which points to the *next* instruction to be executed in the code segment.

Everytime an instruction is exec, the EIP is updated to point at the next instruction.

## Debug Registers
Debug registers controls the debug operation of the processor.
DR0-DR7

In the context of RE, we are mostly interested in the first four debug registers **DR0-DR3**, which are used to store hardware breakpoints on specific addresses which will be triggered if a desired condition is met.

In other words, **DR0-DR3** registers contain addresses where, if a specific type of memory access occurs, the execution of the program will pause, giving us the opportunity to examine it under the debugger.

**Hardware breakpoint on memory access** Can set to trigger if address is refernced for read or write by an instruction.  
**Hardware breakpoint on execution** Can set to trigger on every attempt to exec instructions starting from that address.  

However, keep in mind that debug registers are **privileged resources**, which means that we annot directly access them from the **Ring 3** level (also called 'userland') where software is normally executed.

***Each thread inside a process has its own CPU context meaning when we set a HW breakpoint on a specific memory area inside the process, if the process starts a new thread that accesses the same memory area--no HW breakpoints will be triggered. UNLESS the debugger is capable of debugging multi-threaded applications.***

Software bps work by substituting the original byte located in the address, where we set the bp, with a 0xCC byte (INT 3h). This is always effective regardless of whether the process is multi-threaded.

## Machine Specific Registers (MSRs)
Also called "Model-Specific Registers"
They handle system-related funcs and are not accessible to apps, except from the **Time-Stamp Counter**.

This is a **64-bit register**, and its content can be read using the **RDTSC** instruction which stands for **Read Time-Stamp Counter**.  The low-order 32 bits are loaded into the EAX reg, while the high-order 32 bits are loaded into the EDX reg.

The **Time-Stamp Counter** register is increased by the processor at every clock cycle. It will be reset to zero when the processor is reset.

## Lesson 7 - The Virtual Memory Manager

https://docs.microsoft.com/en-us/previous-versions//cc767886(v=technet.10)?redirectedfrom=MSDN




# The Necessary Theory: Part 2 - Study Guide

#

#