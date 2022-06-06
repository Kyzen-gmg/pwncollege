https://www.youtube.com/watch?v=d4Pgi5XML8E&t=592s

# Class 1
## Assemblers
Assemblers convert the assembly code into binary opcodes
Each instruction is represented by a binary opcode
    - move rax,1 = 0x48C7C001000000

Assembled Bytecode is an "object code"  

## Linking
High Level > Assembly > Assembled Bytecode > 

## Output Formats
PE (Windows)
ELF (Linux)
Mach-O (OSX)
COFF/ECOFF

## ELF Files
- ELF Header
- Sections
- Segments

### Symbols
ELF objects contain a maximum of two symbol tables
    .symtab: Symbols used for debugging/labelling
    .dynsym: Contains symbols needed for dynamic linking

## Computer Architecture 101
When a program is running, the following must happen:
1.  An instruction is read into mem
2.  The instruction is processed bythe Arithmetic Logic Unit
3.  The result of the operation is stored into registers or mem

For this course, we'll deconstruct C programs into four core components
- Registers
- Instructions
- Stack
- Heap

### Machine Cycle
1.  Step 1 - Fetch instruction from mem
2.  Step 2 - Decode instructions into commands
3.  Step 3 - Execute commands
4.  Step 4 - Store results in mem

## x86_64 Architecture
- Orginal spec was created by AMD in 2000

### Registers
Register Name   64bit   32bit   16bit   8bit
R0              RAX     EAX     AX      AH
R1              RCX     ECX     CX      CH       
R2              RDX     EDX     DX      DH
R3              RBX     EBX     BX      BH
R4              RSP     ESP     SP
R5              RBP     EBP     BP
R6              RSI     ESI     ESI
R7              RDI     EDI     DI
.
.
R15

### Registers: Special Purpose
RIP: Instruction pointer
- points to the next instruction to be executed
- 64 bits in width

RFLAGS:     Stores flags used for processor flow control
FPR0-FPR7:  Floating point status and control registers
RBP/RSP:    Stack manipulation and usage

## x86_64 Instructions: mov
```
mov rax, rbx
```
moves the value stored in RBX to RAX
```
mov rax, [rcx]
```
moves the value *pointed* to by RCX into RAX (Instead of the value, it moves the mem address where the value is located)

## x86_64 Instructions: add/sub
```
add rax, rbx
```
adds rbx to rax, the result is stored in rax
rax += rbx
```
sub rax, rbx
```
subtracts rbx from rax, stores the result in rax
rax -= rbx

## x86_64 Instructions: and/xor
```
and rax,rax
```
performs the binary operation AND on the two operands, storing the result in the first.  
This syntax is used for other binary operations as well:  
    - xor  
    - or

## x86_64: The Stack
POP: Reads from stack  
PUSH: Writes to stack  
RSP points to top of stack  
RBP contains base pointer  
**Grows from high to low***

## x86_64 Instructions: push/pop
```
push rax
```
PUSH will grow the stack by 8 and store the operand contents on the stack. (Increases the value pointed to by rsp by 8, and stores rax there)
```
pop rbx
```
POP will load the value pointed to by rsp into the operand. (Loads the value pointed to by rsp into rbx, and decreases rsp by 8)

## x86_64 Instructions: jmp/call
jmp is used to change what code is being executed  
    - Modifies the value in EIP  
    - jmp 0x1000300  
        - Set EIP to 0x1000300 and execute the instructions there
call is used to implement function calls  
    - Pushes value of rbp and rip onto stack before jumping
    - call 0x18000000

## x86_64 Instructions: cmp
cmp performs a caomparison operation bye subtracting the operands  
    - No storage is performed (unlike sub)  
    - Based on the result, fields in RFLAGS are set  
    - cmp rax, #5   

The flags in RFLAGS register are used by jmp variants:
jnz: jump if NOT zero
jz: jump if zero

## x86_64: Addressing Modes
Instructions can access regs and mem in various modes  
    - Immediate:  
        - add rax,14; stores 14 into RAX  
    - Reg to Reg:  
        - xor rax,rax; clears the value in RAX  
    - Indirect Access:  
        - add rax, [rbx]; adds the value pointed to by rbx into rax  
        - mov rbx, 1234[8*rax+rcx]  
        -- move word at address 8*RAX+RCX+1234 into rbx

## x86_64 Instructions Exercise
section .text
                global _start
        _start:
                mov rax, 0x2FFF
                mov rbx, 0x3000
                or rax, rbx
                mov rcv, 0x10000
                sub rcx, rax
                add rcx, rbx
                cmp rax, rbx
                jg _greater
                mov rax, 0x2
        _greater:
                mov rax, 0x1
                ret

## Program Startup
System V ABI?
    - This determines how a program starts and is loaded!
    - Determines how information in the ELF header is parsed
e_entry field/ _start()/ main()

## Control Flow
- Control flow is the order in which instructions are executed
- Common statements used to manipulate control flow include:
   - if / else
   - goto
   - switch
   - while
- These statements can be reconstructed by analyzing the resulting assembly code

- RIP contains the address of the next instruction to execute
- The JMP instruction (and others) can alter RIP
    -JMP ADDR
- JMP can also selectively execute based on the RFLAGS register
    - JE: Jump if equal/zero
    - JNE: Jump if not equal/nonzero
    - JG: Jump if greater (signed)
    - JL: Jump if less (signed)

## Switch Cases
    - Switch cases allow a var to be cmp against a list of values
        - Each value being compared against is a case
    - Switch statements can contain any number of cases
    - The expression for the case must have the same data type as the variable in the switch
    - The switch statement terminates on a break statement

# Class 2
https://www.youtube.com/watch?v=uyWVztMHWtk

## Functions
- Functions can be thought of as three components:
    - Prologue  
    - Body  
    - Epilogue  
- The prologue saves the SFP and reserves space for variables on the stack
- The epilogue cleans up the stack frame and returns it to it's prior state

## Heap Memory
- The heap is used for dynamic mem allocs  
    - Used when the size of a var can be varied  
    - malloc/calloc - Used to allocate

- Heap mem is not managed automatically  
    - Devs must manage it manually  
    - free(var) - used to free mem  
    - Failure to do so results in "mem leaks"  

- Heap vars can be accessed globally

## Array Accesses
- Array accesses often utilize the LEA instruction  
- LEA = Load Effective Address  
    - Loads the address of the mem calculation into the register  
    - Does not dereference the value as MOV would  
- LEA EAX, [EAX + EBX + 1234567]  
    - Stores the value of EAX+EBX+1234567 into EAX  
    - Does not dereference!

# Class 3
https://www.youtube.com/watch?v=RFG5FuqY0CE



