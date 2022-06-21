
# Main Resources
https://www.tutorialspoint.com/cprogramming/c_header_files.htm  

## Supplemental Resources
https://courses.cs.washington.edu/courses/cse351/17wi/lectures/CSE351-L02-memory-I_17wi.pdf
https://www.youtube.com/watch?v=-uleG_Vecishttps://www.youtube.com/watch?v=-uleG_Vecis

# Integer Types
```
Type           Storage size                         Value range  
char             1 byte                               -128 to 127 or 0 to 255  
unsigned char    1 byte                               0 to 255  
signed char      1 byte                               -128 to 127  
int              2 or 4 bytes                         -32,768 to 32,767 or -2,147,483,648 to 2,147,483,647  
unsigned int     2 or 4 bytes                         0 to 65,535 or 0 to 4,294,967,295  
short            2 bytes                              -32,768 to 32,767  
unsigned short   2 bytes                              0 to 65,535  
long             8 bytes or (4bytes for 32 bit OS)    -9223372036854775808 to 9223372036854775807  
unsigned long    8 bytes                              0 to 18446744073709551615
```

## Exact size on a platform
```c
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>

int main(int argc, char** argv) {

    printf("CHAR_BIT    :   %d\n", CHAR_BIT);
    printf("CHAR_MAX    :   %d\n", CHAR_MAX);
    printf("CHAR_MIN    :   %d\n", CHAR_MIN);
    printf("INT_MAX     :   %d\n", INT_MAX);
    printf("INT_MIN     :   %d\n", INT_MIN);
    printf("LONG_MAX    :   %ld\n", (long) LONG_MAX);
    printf("LONG_MIN    :   %ld\n", (long) LONG_MIN);
    printf("SCHAR_MAX   :   %d\n", SCHAR_MAX);
    printf("SCHAR_MIN   :   %d\n", SCHAR_MIN);
    printf("SHRT_MAX    :   %d\n", SHRT_MAX);
    printf("SHRT_MIN    :   %d\n", SHRT_MIN);
    printf("UCHAR_MAX   :   %d\n", UCHAR_MAX);
    printf("UINT_MAX    :   %u\n", (unsigned int) UINT_MAX);
    printf("ULONG_MAX   :   %lu\n", (unsigned long) ULONG_MAX);
    printf("USHRT_MAX   :   %d\n", (unsigned short) USHRT_MAX);

    return 0;
}
```

# Floating Types
Type	        Storage size	Value range	            Precision
float	        4 byte	        1.2E-38 to 3.4E+38	    6 decimal places
double	        8 byte	        2.3E-308 to 1.7E+308	15 decimal places
long double	    10 byte	        3.4E-4932 to 1.1E+4932	19 decimal places

## Exact size on a platform
```c
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>

int main(int argc, char** argv) {

    printf("Storage size for float : %d \n", sizeof(float));
    printf("FLT_MAX     :   %g\n", (float) FLT_MAX);
    printf("FLT_MIN     :   %g\n", (float) FLT_MIN);
    printf("-FLT_MAX    :   %g\n", (float) -FLT_MAX);
    printf("-FLT_MIN    :   %g\n", (float) -FLT_MIN);
    printf("DBL_MAX     :   %g\n", (double) DBL_MAX);
    printf("DBL_MIN     :   %g\n", (double) DBL_MIN);
    printf("-DBL_MAX     :  %g\n", (double) -DBL_MAX);
    printf("Precision value: %d\n", FLT_DIG );

    return 0;
}
```

# Constants
Using #define preprocessor:
#define <identifier> <value>
#define LENGTH 10

Using const keyword:
const int <identifier> <value>
const int LENGTH 10

**Note that it is a good programming practice to define constants in CAPITALS.**

# Storage Classes
A storage class defines the scope (visibility) and life-time of variables and/or functions within a C program. They preced the type that they modify. We have four different storage clases in a C program.
    - auto
    - register
    - static
    - extern

## auto
Default storage class for all local variables. 'auto' can only be used within functions, i.e., local variables.
```c
{
    int mount;
    auto int month;
}
```

## register
The register storage class is used to define local vars that should be stored in a reg instead of RAM. This means that the variable has a maximum size equal to the reg size (usually one word) and can't have the unary '&' operator applied to it (as it does not have a mem location).
```c
{
    register int miles;
}
```

## static
The static storage class instructs the compiler to keep a local var in existence during the life-time of the program instead of creating and destroying it each time it comes into and goes out of scope. Therefore, making local vars static allows them to maintain their values between func calls.

The static modifier may also be applied to global vars. When this is done, it causes that var's scope to be restricted to the file in which it is declared.

In C programming, when static is used on a global var, it causes only one copy of that member to be shared by all the objects of its class.

## extern
The extern storage class is used to give a ref of a global var that is visible to ALL the program files. When you use 'extern', the var cannot be initialized however, it points the var name at a storage location that has been previously defined.

When you have multiple files and you define a global var or func, which will also be used in other files, then extern will be used in another file to provide the reference of defined var or func.  
**Just for understanding, extern is used to declare a global var or func in another file.**  
The extern modifier is most commonly used when there are two or more files sharing the same global vars or funcs as explained below.


**First File: main.c**
```c
#include <stdio.h>
 
int count ;
extern void write_extern();
 
main() {
   count = 5;
   write_extern();
}
```
**Second File: support.c**
```c
#include <stdio.h>
 
extern int count;
 
void write_extern(void) {
   printf("count is %d\n", count);
}
```

# Operators
An operator is a symbol that tells the compiler to perform specific mathematical or logical functions. C language is rich in built-in operators and provides the following types of operators:
- Arithmetic
- Relational
- Logical
- Bitwise
- Assignment
- Misc

## Arithmetic
The following table shows all the arithmetic operators supported by the C language. Assume variable A holds 10 and variable B holds 20 then −
```
Operator	Description	                                                    Example
+	        Adds two operands.	                                            A + B = 30
−	        Subtracts second operand from the first.	                    A − B = -10
*	        Multiplies both operands.	                                    A * B = 200
/	        Divides numerator by de-numerator.	                            B / A = 2
%	        Modulus Operator and remainder of after an integer division.	B % A = 0
++	        Increment operator increases the integer value by one.	        A++ = 11
--	        Decrement operator decreases the integer value by one.	        A-- = 9
```

## Relational
The following table shows all the relational operators supported by C. Assume variable A holds 10 and variable B holds 20 then −
```
Operator	Description	                                                                                                                            Example
==	        Checks if the values of two operands are equal or not. If yes, then the condition becomes true.	                                        (A == B) is not true.
!=	        Checks if the values of two operands are equal or not. If the values are not equal, then the condition becomes true.	                (A != B) is true.
>	        Checks if the value of left operand is greater than the value of right operand. If yes, then the condition becomes true.	            (A > B) is not true.
<	        Checks if the value of left operand is less than the value of right operand. If yes, then the condition becomes true.	                (A < B) is true.
>=	        Checks if the value of left operand is greater than or equal to the value of right operand. If yes, then the condition becomes true.	(A >= B) is not true.
<=	        Checks if the value of left operand is less than or equal to the value of right operand. If yes, then the condition becomes true.	    (A <= B) is true.
```

## Logical
Following table shows all the logical operators supported by C language. Assume variable A holds 1 and variable B holds 0, then −
```
Operator	Description	                                                                                            Example
&&	        Called Logical AND operator. If both the operands are non-zero, then the condition becomes true.	    (A && B) is false.
||	        Called Logical OR Operator. If any of the two operands is non-zero, then the condition becomes true.	(A || B) is true.
!	        Called Logical NOT Operator. It is used to reverse the logical state of its operand.	                !(A && B) is true.
```

## Bitwise
Bitwise operator works on bits and perform bit-by-bit operation. The truth tables for &, |, and ^ is as follows −
```
p	    q	    p & q	p | q	p ^ q
0	    0	      0	      0	      0
0	    1	      0	      1	      1
1	    1	      1	      1	      0
1	    0	      0	      1	      1
```
Assume A = 60 and B = 13 in binary format, they will be as follows −
```
A = 0011 1100
B = 0000 1101
-----------------
A&B = 0000 1100
A|B = 0011 1101
A^B = 0011 0001
~A = 1100 0011
```
The following table lists the bitwise operators supported by C. Assume variable 'A' holds 60 and variable 'B' holds 13, then −
```
                                                                                                                                                        A = 0011 1100
                                                                                                                                                        B = 0000 1101

Operator	Description	                                                                                                                Example
&	        Binary AND Operator copies a bit to the result if it exists in both operands.	                                            (A & B) = 12, i.e., 0000 1100
|	        Binary OR Operator copies a bit if it exists in either operand.	                                                            (A | B) = 61, i.e., 0011 1101
^	        Binary XOR Operator copies the bit if it is set in one operand but not both.	                                            (A ^ B) = 49, i.e., 0011 0001
~	        Binary One's Complement Operator is unary and has the effect of 'flipping' bits.	                                        (~A ) = ~(60) i.e,. -011 1101
<<	        Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand.	    A << 2 = 240  i.e., 1111 0000
>>	        Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand.	A >> 2 = 15   i.e., 0000 1111
```

## Assignment
The following table lists the assignment operators supported by the C language −
```
Operator	Description	                                                                                                                        Example
=	        Simple assignment operator. Assigns values from right side operands to left side operand	                                        C = A + B will assign the value of A + B to C
+=	        Add AND assignment operator. It adds the right operand to the left operand and assign the result to the left operand.	            C += A is equivalent to C = C + A
-=	        Subtract AND assignment operator. It subtracts the right operand from the left operand and assigns the result to the left operand.	C -= A is equivalent to C = C - A
*=	        Multiply AND assignment operator. It multiplies the right operand with the left operand and assigns the result to the left operand.	C *= A is equivalent to C = C * A
/=	        Divide AND assignment operator. It divides the left operand with the right operand and assigns the result to the left operand.	    C /= A is equivalent to C = C / A
%=	        Modulus AND assignment operator. It takes modulus using two operands and assigns the result to the left operand.	                C %= A is equivalent to C = C % A
<<=	        Left shift AND assignment operator.	                                                                                                C <<= 2 is same as C = C << 2
>>=	        Right shift AND assignment operator.	                                                                                            C >>= 2 is same as C = C >> 2
&=	        Bitwise AND assignment operator.	                                                                                                C &= 2 is same as C = C & 2
^=	        Bitwise exclusive OR and assignment operator.	                                                                                    C ^= 2 is same as C = C ^ 2
|=	        Bitwise inclusive OR and assignment operator.	                                                                                    C |= 2 is same as C = C | 2
```

## Misc Operators ↦ sizeof & ternary
Besides the operators discussed above, there are a few other important operators including sizeof and ? : supported by the C Language.
```
Operator	Description	                            Example
sizeof()	Returns the size of a variable.	        sizeof(a), where a is integer, will return 4.
&	        Returns the address of a variable.	    &a; returns the actual address of the variable.
*	        Pointer to a variable.	                *a;
? :	        Conditional Expression.	                If Condition is true ? then value X : otherwise value Y
```

## Operators Precedence in C
Operator precedence determines the grouping of terms in an expression and decides how an expression is evaluated. Certain operators have higher precedence than others; for example, the multiplication operator has a higher precedence than the addition operator.

For example, x = 7 + 3 * 2; here, x is assigned 13, not 20 because operator * has a higher precedence than +, so it first gets multiplied with 3*2 and then adds into 7.

Here, operators with the highest precedence appear at the top of the table, those with the lowest appear at the bottom. Within an expression, higher precedence operators will be evaluated first.

```
Category	        Operator    	                        Associativity
Postfix	            () [] -> . ++ - -	                    Left to right
Unary	            + - ! ~ ++ - - (type)* & sizeof	        Right to left
Multiplicative	    * / %	                                Left to right
Additive	        + -	                                    Left to right
Shift	            << >>	                                Left to right
Relational	        < <= > >=	                            Left to right
Equality	        == !=	                                Left to right
Bitwise AND	        &	                                    Left to right
Bitwise XOR	        ^	                                    Left to right
Bitwise OR	        |	                                    Left to right
Logical AND	        &&	                                    Left to right
Logical OR	        ||	                                    Left to right
Conditional	        ?:	                                    Right to left
Assignment	        = += -= *= /= %=>>= <<= &= ^= |=	    Right to left
Comma	            ,	                                    Left to right
```

# Decision Making

<img src=img/c01.jpg>

C programming language provides the following types of decision making statements.
```
Sr.No.	        Statement & Description  
1	            if statement  
                An if statement consists of a boolean expression followed by one or more statements.

2	            if...else statement  
                An if statement can be followed by an optional else statement, which executes when the Boolean expression is false.

3	            nested if statements  
                You can use one if or else if statement inside another if or else if statement(s).

4	            switch statement  
                A switch statement allows a variable to be tested for equality against a list of values.

5	            nested switch statements  
                You can use one switch statement inside another switch statement(s).
```


## Switch Statement
A switch statement allows a variable to be tested for equality against a list of values. Each value is called a case, and the variable being switched on is checked for each switch case.

The syntax for a switch statement in C programming language is as follows −
```c
switch(expression) {

   case constant-expression  :
      statement(s);
      break; /* optional */
	
   case constant-expression  :
      statement(s);
      break; /* optional */
  
   /* you can have any number of case statements */
   default : /* Optional */
   statement(s);
}
```
The following rules apply to a switch statement −

The expression used in a switch statement must have an integral or enumerated type, or be of a class type in which the class has a single conversion function to an integral or enumerated type.

You can have any number of case statements within a switch. Each case is followed by the value to be compared to and a colon.

The constant-expression for a case must be the same data type as the variable in the switch, and it must be a constant or a literal.

When the variable being switched on is equal to a case, the statements following that case will execute until a break statement is reached.

When a break statement is reached, the switch terminates, and the flow of control jumps to the next line following the switch statement.

Not every case needs to contain a break. If no break appears, the flow of control will fall through to subsequent cases until a break is reached.

A switch statement can have an optional default case, which must appear at the end of the switch. The default case can be used for performing a task when none of the cases is true. No break is needed in the default case.

### Flow Diagram  
![](img/c05.jpg)

## The ? : Operator
We have covered conditional operator ? : in the previous chapter which can be used to replace if...else statements. It has the following general form −  

Exp1 ? Exp2 : Exp3;  
Where Exp1, Exp2, and Exp3 are expressions. Notice the use and placement of the colon.  

The value of a ? expression is determined like this −  

Exp1 is evaluated. If it is true, then Exp2 is evaluated and becomes the value of the entire ? expression.  

If Exp1 is false, then Exp3 is evaluated and its value becomes the value of the expression.  

# Loops
C programming language provides the following types of loops to handle looping requirements.
```
Sr.No.	        Loop Type & Description
1	            while loop
                Repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body.

2	            for loop
                Executes a sequence of statements multiple times and abbreviates the code that manages the loop variable.

3	            do...while loop
                It is more like a while statement, except that it tests the condition at the end of the loop body.

4	            nested loops
                You can use one or more loops inside any other while, for, or do..while loop.
```
## While Loop
A while loop in C programming repeatedly executes a target statement as long as a given condition is true.

The syntax of a while loop in C programming language is −
```c
while(condition) {
statement(s);
}
```
Here, statement(s) may be a single statement or a block of statements. The condition may be any expression, and true is any nonzero value. The loop iterates while the condition is true.

When the condition becomes false, the program control passes to the line immediately following the loop.

### Flow Diagram
![](img/c03.jpg "")

## For Loop
A for loop is a repetition control structure that allows you to efficiently write a loop that needs to execute a specific number of times.

The syntax of a for loop in C programming language is −
```c
for ( init; condition; increment ) {
statement(s);
}
```
Here is the flow of control in a 'for' loop −

The init step is executed first, and only once. This step allows you to declare and initialize any loop control variables. You are not required to put a statement here, as long as a semicolon appears.

Next, the condition is evaluated. If it is true, the body of the loop is executed. If it is false, the body of the loop does not execute and the flow of control jumps to the next statement just after the 'for' loop.

After the body of the 'for' loop executes, the flow of control jumps back up to the increment statement. This statement allows you to update any loop control variables. This statement can be left blank, as long as a semicolon appears after the condition.

The condition is now evaluated again. If it is true, the loop executes and the process repeats itself (body of loop, then increment step, and then again condition). After the condition becomes false, the 'for' loop terminates.

### Flow Diagram
![](img/c04.jpg "")

## Do...while Loop
Unlike for and while loops, which test the loop condition at the top of the loop, the do...while loop in C programming checks its condition at the bottom of the loop.

A do...while loop is similar to a while loop, except the fact that it is guaranteed to execute at least one time.

The syntax of a do...while loop in C programming language is −
```c
do {
statement(s);
} while( condition );
Notice that the conditional expression appears at the end of the loop, so the statement(s) in the loop executes once before the condition is tested.
```
If the condition is true, the flow of control jumps back up to do, and the statement(s) in the loop executes again. This process repeats until the given condition becomes false.

### Flow Diagram
![](img/c06.jpg "")

## Nested Loops
C programming allows to use one loop inside another loop. The following section shows a few examples to illustrate the concept.

The syntax for a nested for loop statement in C is as follows −
```c
for ( init; condition; increment ) {

for ( init; condition; increment ) {
statement(s);
}
statement(s);
}
```
The syntax for a nested while loop statement in C programming language is as follows −
```c
while(condition) {

while(condition) {
statement(s);
}
statement(s);
}
```
The syntax for a nested do...while loop statement in C programming language is as follows −
```c
do {
statement(s);

do {
statement(s);
}while( condition );

}while( condition );
```
A final note on loop nesting is that you can put any type of loop inside any other type of loop. For example, a 'for' loop can be inside a 'while' loop or vice versa.

## Break Statements
The break statement in C programming has the following two usages −

When a break statement is encountered inside a loop, the loop is immediately terminated and the program control resumes at the next statement following the loop.

It can be used to terminate a case in the switch statement (covered in the next chapter).

If you are using nested loops, the break statement will stop the execution of the innermost loop and start executing the next line of code after the block.

The syntax for a break; statement in C is as follows −
```c
break;
```
### Flow Diagram
![](img/c07.jpg "")

## Continue Statements
The continue statement in C programming works somewhat like the break statement. Instead of forcing termination, it forces the next iteration of the loop to take place, skipping any code in between.

For the for loop, continue statement causes the conditional test and increment portions of the loop to execute. For the while and do...while loops, continue statement causes the program control to pass to the conditional tests.

The syntax for a continue statement in C is as follows −
```c
continue;
```
### Flow Diagram
![](img/c08.jpg "")

## Goto Statements
A goto statement in C programming provides an unconditional jump from the 'goto' to a labeled statement in the same function.

NOTE − Use of goto statement is highly discouraged in any programming language because it makes difficult to trace the control flow of a program, making the program hard to understand and hard to modify. Any program that uses a goto can be rewritten to avoid them.

The syntax for a goto statement in C is as follows −
```c
goto label;
..
.
label: statement;
```
Here label can be any plain text except C keyword and it can be set anywhere in the C program above or below to goto statement.

### Flow Diagram
![](img/c09.jpg "")

# The Infinite Loop
A loop becomes an infinite loop if a condition never becomes false. The for loop is traditionally used for this purpose. Since none of the three expressions that form the 'for' loop are required, you can make an endless loop by leaving the conditional expression empty.
```c
#include <stdio.h>
 
int main () {

   for( ; ; ) {
      printf("This loop will run forever.\n");
   }

   return 0;
}
```
When the conditional expression is absent, it is assumed to be true. You may have an initialization and increment expression, but C programmers more commonly use the for(;;) construct to signify an infinite loop.

NOTE − You can terminate an infinite loop by pressing Ctrl + C keys.

# Functions
A function is a group of statements that together perform a task. Every C program has at least one function, which is main(), and all the most trivial programs can define additional functions.

You can divide up your code into separate functions. How you divide up your code among different functions is up to you, but logically the division is such that each function performs a specific task.

A function declaration tells the compiler about a function's name, return type, and parameters. A function definition provides the actual body of the function.

The C standard library provides numerous built-in functions that your program can call. For example, strcat() to concatenate two strings, memcpy() to copy one memory location to another location, and many more functions.

A function can also be referred as a method or a sub-routine or a procedure, etc.

## Defining a Function
The general form of a function definition in C programming language is as follows −
```c
return_type function_name( parameter list ) {
   body of the function
}
```
A function definition in C programming consists of a function header and a function body. Here are all the parts of a function −

Return Type − A function may return a value. The return_type is the data type of the value the function returns. Some functions perform the desired operations without returning a value. In this case, the return_type is the keyword void.

Function Name − This is the actual name of the function. The function name and the parameter list together constitute the function signature.

Parameters − A parameter is like a placeholder. When a function is invoked, you pass a value to the parameter. This value is referred to as actual parameter or argument. The parameter list refers to the type, order, and number of the parameters of a function. Parameters are optional; that is, a function may contain no parameters.

Function Body − The function body contains a collection of statements that define what the function does.

### Example
Given below is the source code for a function called max(). This function takes two parameters num1 and num2 and returns the maximum value between the two −
```c
/* function returning the max between two numbers */
int max(int num1, int num2) {

   /* local variable declaration */
   int result;
 
   if (num1 > num2)
      result = num1;
   else
      result = num2;
 
   return result; 
}
```

### Function Declarations
A function declaration tells the compiler about a function name and how to call the function. The actual body of the function can be defined separately.

A function declaration has the following parts −

return_type function_name( parameter list );
For the above defined function max(), the function declaration is as follows −

int max(int num1, int num2);
Parameter names are not important in function declaration only their type is required, so the following is also a valid declaration −

int max(int, int);
Function declaration is required when you define a function in one source file and you call that function in another file. In such case, you should declare the function at the top of the file calling the function.

### Calling a Function

While creating a C function, you give a definition of what the function has to do. To use a function, you will have to call that function to perform the defined task.

When a program calls a function, the program control is transferred to the called function. A called function performs a defined task and when its return statement is executed or when its function-ending closing brace is reached, it returns the program control back to the main program.

To call a function, you simply need to pass the required parameters along with the function name, and if the function returns a value, then you can store the returned value. For example −
```c
#include <stdio.h>
 
/* function declaration */
int max(int num1, int num2);
 
int main () {

   /* local variable definition */
   int a = 100;
   int b = 200;
   int ret;
 
   /* calling a function to get max value */
   ret = max(a, b);
 
   printf( "Max value is : %d\n", ret );
 
   return 0;
}
 
/* function returning the max between two numbers */
int max(int num1, int num2) {

   /* local variable declaration */
   int result;
 
   if (num1 > num2)
      result = num1;
   else
      result = num2;
 
   return result; 
```

### Function Arguments
If a function is to use arguments, it must declare variables that accept the values of the arguments. These variables are called the formal parameters of the function.

Formal parameters behave like other local variables inside the function and are created upon entry into the function and destroyed upon exit.

While calling a function, there are two ways in which arguments can be passed to a function −
```
Sr.No.	Call Type & Description
1	    Call by value
        This method copies the actual value of an argument into the formal parameter of the function. In this case, changes made to the parameter inside the function have no effect on the argument.

2	    Call by reference
        This method copies the address of an argument into the formal parameter. Inside the function, the address is used to access the actual argument used in the call. This means that changes made to the parameter affect the argument.
```
By default, C uses call by value to pass arguments. In general, it means the code within a function cannot alter the arguments used to call the function.

## Call by Value
The call by value method of passing arguments to a function copies the actual value of an argument into the formal parameter of the function. In this case, changes made to the parameter inside the function have no effect on the argument.

By default, C programming uses call by value to pass arguments. In general, it means the code within a function cannot alter the arguments used to call the function. Consider the function swap() definition as follows.

```c
/* function definition to swap the values */
void swap(int x, int y) {

   int temp;

   temp = x; /* save the value of x */
   x = y;    /* put y into x */
   y = temp; /* put temp into y */
  
   return;
}
```
Now, let us call the function swap() by passing actual values as in the following example −

```c
#include <stdio.h>
 
/* function declaration */
void swap(int x, int y);
 
int main () {

   /* local variable definition */
   int a = 100;
   int b = 200;
 
   printf("Before swap, value of a : %d\n", a );
   printf("Before swap, value of b : %d\n", b );
 
   /* calling a function to swap the values */
   swap(a, b);
 
   printf("After swap, value of a : %d\n", a );
   printf("After swap, value of b : %d\n", b );
 
   return 0;
}
void swap(int x, int y) {

   int temp;

   temp = x; /* save the value of x */
   x = y;    /* put y into x */
   y = temp; /* put temp into y */
  
   return;
}
```
Let us put the above code in a single C file, compile and execute it, it will produce the following result −
```
Before swap, value of a : 100
Before swap, value of b : 200
After swap, value of a : 100
After swap, value of b : 200
```
It shows that there are no changes in the values, though they had been changed inside the function.

## Call by Reference
The call by reference method of passing arguments to a function copies the address of an argument into the formal parameter. Inside the function, the address is used to access the actual argument used in the call. It means the changes made to the parameter affect the passed argument.

To pass a value by reference, argument pointers are passed to the functions just like any other value. So accordingly you need to declare the function parameters as pointer types as in the following function swap(), which exchanges the values of the two integer variables pointed to, by their arguments.
```c
/* function definition to swap the values */
void swap(int *x, int *y) {

int temp;
temp = *x; /* save the value at address x */
*x = *y; /* put y into x */
*y = temp; /* put temp into y */

return;
}
```
Let us now call the function swap() by passing values by reference as in the following example −

```c
#include <stdio.h>

int main () {

   /* local variable definition */
   int a = 100;
   int b = 200;
 
   printf("Before swap, value of a : %d\n", a );
   printf("Before swap, value of b : %d\n", b );
 
   /* calling a function to swap the values */
   swap(&a, &b);
 
   printf("After swap, value of a : %d\n", a );
   printf("After swap, value of b : %d\n", b );
 
   return 0;
}
void swap(int *x, int *y) {

   int temp;

   temp = *x; /* save the value of x */
   *x = *y;    /* put y into x */
   *y = temp; /* put temp into y */
  
   return;
}
```
Let us put the above code in a single C file, compile and execute it, to produce the following result −
```
Before swap, value of a : 100
Before swap, value of b : 200
After swap, value of a : 200
After swap, value of b : 100
```
It shows that the change has reflected outside the function as well, unlike call by value where the changes do not reflect outside the function.

# Scope Rules
A scope in any programming is a region of the program where a defined variable can have its existence and beyond that variable it cannot be accessed. There are three places where variables can be declared in C programming language −

Inside a function or a block which is called local variables.

Outside of all functions which is called global variables.

In the definition of function parameters which are called formal parameters.

Let us understand what are local and global variables, and formal parameters.

## Local Variables
Variables that are declared inside a function or block are called local variables. They can be used only by statements that are inside that function or block of code. Local variables are not known to functions outside their own. The following example shows how local variables are used. Here all the variables a, b, and c are local to main() function.
```c
#include <stdio.h>
 
int main () {

  /* local variable declaration */
  int a, b;
  int c;
 
  /* actual initialization */
  a = 10;
  b = 20;
  c = a + b;
 
  printf ("value of a = %d, b = %d and c = %d\n", a, b, c);
 
  return 0;
}
```

## Global Variables
Global variables are defined outside a function, usually on top of the program. Global variables hold their values throughout the lifetime of your program and they can be accessed inside any of the functions defined for the program.

A global variable can be accessed by any function. That is, a global variable is available for use throughout your entire program after its declaration. The following program show how global variables are used in a program.
```c
#include <stdio.h>
 
/* global variable declaration */
int g;
 
int main () {

  /* local variable declaration */
  int a, b;
 
  /* actual initialization */
  a = 10;
  b = 20;
  g = a + b;
 
  printf ("value of a = %d, b = %d and g = %d\n", a, b, g);
 
  return 0;
}
```
A program can have same name for local and global variables but the value of local variable inside a function will take preference. Here is an example −

```c
#include <stdio.h>
 
/* global variable declaration */
int g = 20;
 
int main () {

  /* local variable declaration */
  int g = 10;
 
  printf ("value of g = %d\n",  g);
 
  return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
value of g = 10
```

## Formal Parameters
Formal parameters, are treated as local variables with-in a function and they take precedence over global variables. Following is an example −

```c
#include <stdio.h>
 
/* global variable declaration */
int a = 20;
 
int main () {

  /* local variable definition in main function */
  int a = 10;
  int b = 20;
  int c = 0;

  printf ("value of a in main() = %d\n",  a);
  c = sum( a, b);
  printf ("value of c in main() = %d\n",  c);

  return 0;
}

/* function to add two integers */
int sum(int a, int b) {

   printf ("value of a in sum() = %d\n",  a);
   printf ("value of b in sum() = %d\n",  b);

   return a + b;
}
```
When the above code is compiled and executed, it produces the following result −
```
value of a in main() = 10
value of a in sum() = 10
value of b in sum() = 20
value of c in main() = 30
```

## Initializing Local and Global Variables
When a local variable is defined, it is not initialized by the system, you must initialize it yourself. Global variables are initialized automatically by the system when you define them as follows −
```
Data Type	    Initial Default Value
int	            0
char	            '\0'
float	            0
double	         0
pointer	         NULL
```
**It is a good programming practice to initialize variables properly, otherwise your program may produce unexpected results, because uninitialized variables will take some garbage value already available at their memory location.**

# Arrays
Arrays a kind of data structure that can store a fixed-size sequential collection of elements of the same type. An array is used to store a collection of data, but it is often more useful to think of an array as a collection of variables of the same type.

Instead of declaring individual variables, such as number0, number1, ..., and number99, you declare one array variable such as numbers and use numbers[0], numbers[1], and ..., numbers[99] to represent individual variables. A specific element in an array is accessed by an index.

All arrays consist of contiguous memory locations. The lowest address corresponds to the first element and the highest address to the last element.

![](img/arrays.jpg)

## Declaring Arrays
To declare an array in C, a programmer specifies the type of the elements and the number of elements required by an array as follows −
```c
type arrayName [ arraySize ];
```
This is called a single-dimensional array. The arraySize must be an integer constant greater than zero and type can be any valid C data type. For example, to declare a 10-element array called balance of type double, use this statement −
```c
double balance[10];
```
Here *balance* is a variable array which is sufficient to hold up to 10 double numbers.

## Initializing Arrays

You can initialize an array in C either one by one or using a single statement as follows −
```c
double balance[5] = {1000.0, 2.0, 3.4, 7.0, 50.0};
```
The number of values between braces { } cannot be larger than the number of elements that we declare for the array between square brackets [ ].

If you omit the size of the array, an array just big enough to hold the initialization is created. Therefore, if you write −
```c
double balance[] = {1000.0, 2.0, 3.4, 7.0, 50.0};
```
You will create exactly the same array as you did in the previous example. Following is an example to assign a single element of the array −
```c
balance[4] = 50.0;
```
The above statement assigns the 5th element in the array with a value of 50.0. All arrays have 0 as the index of their first element which is also called the base index and the last index of an array will be total size of the array minus 1. Shown below is the pictorial representation of the array we discussed above −

![](img/array_presentation.jpg)

## Accessing Array Elements
Accessing Array Elements

An element is accessed by indexing the array name. This is done by placing the index of the element within square brackets after the name of the array. For example −
```c
double salary = balance[9];
```
The above statement will take the 10th element from the array and assign the value to salary variable. The following example Shows how to use all the three above mentioned concepts viz. declaration, assignment, and accessing arrays −
```c
#include <stdio.h>
 
int main () {

   int n[ 10 ]; /* n is an array of 10 integers */
   int i,j;
 
   /* initialize elements of array n to 0 */         
   for ( i = 0; i < 10; i++ ) {
      n[ i ] = i + 100; /* set element at location i to i + 100 */
   }
   
   /* output each array element's value */
   for (j = 0; j < 10; j++ ) {
      printf("Element[%d] = %d\n", j, n[j] );
   }
 
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Element[0] = 100
Element[1] = 101
Element[2] = 102
Element[3] = 103
Element[4] = 104
Element[5] = 105
Element[6] = 106
Element[7] = 107
Element[8] = 108
Element[9] = 109
```

# Arrays in Detail

Arrays are important to C and should need a lot more attention. The following important concepts related to array should be clear to a C programmer −

## Multi-dimensional Arrays in C
C programming language allows multidimensional arrays. Here is the general form of a multidimensional array declaration −
```c
type name[size1][size2]...[sizeN];
```
For example, the following declaration creates a three dimensional integer array −
```c
int threedim[5][10][4];
```

### Two-dimensional Arrays

The simplest form of multidimensional array is the two-dimensional array. A two-dimensional array is, in essence, a list of one-dimensional arrays. To declare a two-dimensional integer array of size [x][y], you would write something as follows −
```c
type arrayName [ x ][ y ];
```
Where **type** can be any valid C data type and **arrayName** will be a valid C identifier. A two-dimensional array can be considered as a table which will have x number of rows and y number of columns. A two-dimensional array **a**, which contains three rows and four columns can be shown as follows −

![](img/two_dimensional_arrays.jpg)

Thus, every element in the array a is identified by an element name of the form a[ i ][ j ], where 'a' is the name of the array, and 'i' and 'j' are the subscripts that uniquely identify each element in 'a'.

### Initializing Two-Dimensional Arrays
Multidimensional arrays may be initialized by specifying bracketed values for each row. Following is an array with 3 rows and each row has 4 columns.
```c
int a[3][4] = {  
   {0, 1, 2, 3} ,   /*  initializers for row indexed by 0 */
   {4, 5, 6, 7} ,   /*  initializers for row indexed by 1 */
   {8, 9, 10, 11}   /*  initializers for row indexed by 2 */
};
```
The nested braces, which indicate the intended row, are optional. The following initialization is equivalent to the previous example −
```c
int a[3][4] = {0,1,2,3,4,5,6,7,8,9,10,11};
```

### Accessing Two-Dimensional Array Elements
An element in a two-dimensional array is accessed by using the subscripts, i.e., row index and column index of the array. For example −
```c
int val = a[2][3];
```
The above statement will take the 4th element from the 3rd row of the array. You can verify it in the above figure. Let us check the following program where we have used a nested loop to handle a two-dimensional array −

```c
#include <stdio.h>
 
int main () {

   /* an array with 5 rows and 2 columns*/
   int a[5][2] = { {0,0}, {1,2}, {2,4}, {3,6},{4,8}};
   int i, j;
 
   /* output each array element's value */
   for ( i = 0; i < 5; i++ ) {

      for ( j = 0; j < 2; j++ ) {
         printf("a[%d][%d] = %d\n", i,j, a[i][j] );
      }
   }
   
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```c
a[0][0]: 0
a[0][1]: 0
a[1][0]: 1
a[1][1]: 2
a[2][0]: 2
a[2][1]: 4
a[3][0]: 3
a[3][1]: 6
a[4][0]: 4
a[4][1]: 8
```
As explained above, you can have arrays with any number of dimensions, although it is likely that most of the arrays you create will be of one or two dimensions.

### Passing Arrays as Function Arguments in C
If you want to pass a single-dimension array as an argument in a function, you would have to declare a formal parameter in one of following three ways and all three declaration methods produce similar results because each tells the compiler that an integer pointer is going to be received. Similarly, you can pass multi-dimensional arrays as formal parameters.
Way-1

Formal parameters as a pointer −
```c
void myFunction(int *param) {
   .
   .
   .
}
```
Way-2

Formal parameters as a sized array −
```c
void myFunction(int param[10]) {
   .
   .
   .
}
```
Way-3

Formal parameters as an unsized array −
```c
void myFunction(int param[]) {
   .
   .
   .
}
```
Example

Now, consider the following function, which takes an array as an argument along with another argument and based on the passed arguments, it returns the average of the numbers passed through the array as follows −
```c
double getAverage(int arr[], int size) {

   int i;
   double avg;
   double sum = 0;

   for (i = 0; i < size; ++i) {
      sum += arr[i];
   }

   avg = sum / size;

   return avg;
}
```
Now, let us call the above function as follows −
```c
#include <stdio.h>
 
/* function declaration */
double getAverage(int arr[], int size);

int main () {

   /* an int array with 5 elements */
   int balance[5] = {1000, 2, 3, 17, 50};
   double avg;

   /* pass pointer to the array as an argument */
   avg = getAverage( balance, 5 ) ;
 
   /* output the returned value */
   printf( "Average value is: %f ", avg );
    
   return 0;
}
```
When the above code is compiled together and executed, it produces the following result −

Average value is: 214.400000

As you can see, the length of the array doesn't matter as far as the function is concerned because C performs no bounds checking for formal parameters.

### Return array from function in C
C programming does not allow to return an entire array as an argument to a function. However, you can return a pointer to an array by specifying the array's name without an index.

If you want to return a single-dimension array from a function, you would have to declare a function returning a pointer as in the following example −
```c
int * myFunction() {
   .
   .
   .
}
```
Second point to remember is that C does not advocate to return the address of a local variable to outside of the function, so you would have to define the local variable as static variable.

Now, consider the following function which will generate 10 random numbers and return them using an array and call this function as follows −
```c
#include <stdio.h>

/* function to generate and return random numbers */
int * getRandom( ) {

   static int  r[10];
   int i;

   /* set the seed */
   srand( (unsigned)time( NULL ) );
  
   for ( i = 0; i < 10; ++i) {
      r[i] = rand();
      printf( "r[%d] = %d\n", i, r[i]);
   }

   return r;
}

/* main function to call above defined function */
int main () {

   /* a pointer to an int */
   int *p;
   int i;

   p = getRandom();
	
   for ( i = 0; i < 10; i++ ) {
      printf( "*(p + %d) : %d\n", i, *(p + i));
   }

   return 0;
}
```
When the above code is compiled together and executed, it produces the following result −
```
r[0] = 313959809
r[1] = 1759055877
r[2] = 1113101911
r[3] = 2133832223
r[4] = 2073354073
r[5] = 167288147
r[6] = 1827471542
r[7] = 834791014
r[8] = 1901409888
r[9] = 1990469526
*(p + 0) : 313959809
*(p + 1) : 1759055877
*(p + 2) : 1113101911
*(p + 3) : 2133832223
*(p + 4) : 2073354073
*(p + 5) : 167288147
*(p + 6) : 1827471542
*(p + 7) : 834791014
*(p + 8) : 1901409888
*(p + 9) : 1990469526
```

## Pointer to an Array in C
It is most likely that you would not understand this section until you are through with the chapter 'Pointers'.

Assuming you have some understanding of pointers in C, let us start: An array name is a constant pointer to the first element of the array. Therefore, in the declaration −
```c
double balance[50];
```
balance is a pointer to &balance[0], which is the address of the first element of the array balance. Thus, the following program fragment assigns p as the address of the first element of balance −
```c
double *p;
double balance[10];

p = balance;
```
It is legal to use array names as constant pointers, and vice versa. Therefore, *(balance + 4) is a legitimate way of accessing the data at balance[4].

Once you store the address of the first element in 'p', you can access the array elements using *p, *(p+1), *(p+2) and so on. Given below is the example to show all the concepts discussed above −
```c
#include <stdio.h>

int main () {

   /* an array with 5 elements */
   double balance[5] = {1000.0, 2.0, 3.4, 17.0, 50.0};
   double *p;
   int i;

   p = balance;
 
   /* output each array element's value */
   printf( "Array values using pointer\n");
	
   for ( i = 0; i < 5; i++ ) {
      printf("*(p + %d) : %f\n",  i, *(p + i) );
   }

   printf( "Array values using balance as address\n");
	
   for ( i = 0; i < 5; i++ ) {
      printf("*(balance + %d) : %f\n",  i, *(balance + i) );
   }
 
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Array values using pointer
*(p + 0) : 1000.000000
*(p + 1) : 2.000000
*(p + 2) : 3.400000
*(p + 3) : 17.000000
*(p + 4) : 50.000000
Array values using balance as address
*(balance + 0) : 1000.000000
*(balance + 1) : 2.000000
*(balance + 2) : 3.400000
*(balance + 3) : 17.000000
*(balance + 4) : 50.000000
```
In the above example, p is a pointer to double, which means it can store the address of a variable of double type. Once we have the address in p, *p will give us the value available at the address stored in p, as we have shown in the above example.

# C - Pointers
Pointers in C are easy and fun to learn. Some C programming tasks are performed more easily with pointers, and other tasks, such as dynamic memory allocation, cannot be performed without using pointers. So it becomes necessary to learn pointers to become a perfect C programmer. Let's start learning them in simple and easy steps.

As you know, every variable is a memory location and every memory location has its address defined which can be accessed using ampersand (&) operator, which denotes an address in memory. Consider the following example, which prints the address of the variables defined −
```c
#include <stdio.h>

int main () {

   int  var1;
   char var2[10];

   printf("Address of var1 variable: %x\n", &var1  );
   printf("Address of var2 variable: %x\n", &var2  );

   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Address of var1 variable: bff5a400
Address of var2 variable: bff5a3f6
```

## What are Pointers?

A pointer is a variable whose value is the address of another variable, i.e., direct address of the memory location. Like any variable or constant, you must declare a pointer before using it to store any variable address. The general form of a pointer variable declaration is −
```
type *var-name;
```
Here, type is the pointer's base type; it must be a valid C data type and var-name is the name of the pointer variable. The asterisk * used to declare a pointer is the same asterisk used for multiplication. However, in this statement the asterisk is being used to designate a variable as a pointer. Take a look at some of the valid pointer declarations −
```
int    *ip;    /* pointer to an integer */
double *dp;    /* pointer to a double */
float  *fp;    /* pointer to a float */
char   *ch     /* pointer to a character */
```
**The actual data type of the value of all pointers, whether integer, float, character, or otherwise, is the same, a long hexadecimal number that represents a memory address. The only difference between pointers of different data types is the data type of the variable or constant that the pointer points to.**

## How to Use Pointers?

There are a few important operations, which we will do with the help of pointers very frequently. (a) We define a pointer variable, (b) assign the address of a variable to a pointer and (c) finally access the value at the address available in the pointer variable. This is done by using unary operator * that returns the value of the variable located at the address specified by its operand. The following example makes use of these operations −
```c
#include <stdio.h>

int main () {

   int  var = 20;   /* actual variable declaration */
   int  *ip;        /* pointer variable declaration */

   ip = &var;  /* store address of var in pointer variable*/

   printf("Address of var variable: %x\n", &var  );

   /* address stored in pointer variable */
   printf("Address stored in ip variable: %x\n", ip );

   /* access the value using the pointer */
   printf("Value of *ip variable: %d\n", *ip );

   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Address of var variable: bffd8b3c
Address stored in ip variable: bffd8b3c
Value of *ip variable: 20
```

## NULL Pointers

It is always a good practice to assign a NULL value to a pointer variable in case you do not have an exact address to be assigned. This is done at the time of variable declaration. A pointer that is assigned NULL is called a null pointer.

The NULL pointer is a constant with a value of zero defined in several standard libraries. Consider the following program −
```c
#include <stdio.h>

int main () {

   int  *ptr = NULL;

   printf("The value of ptr is : %x\n", ptr  );
 
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −

The value of ptr is 0

In most of the operating systems, programs are not permitted to access memory at address 0 because that memory is reserved by the operating system. However, the memory address 0 has special significance; it signals that the pointer is not intended to point to an accessible memory location. But by convention, if a pointer contains the null (zero) value, it is assumed to point to nothing.

To check for a null pointer, you can use an 'if' statement as follows −
```
if(ptr)     /* succeeds if p is not null */
if(!ptr)    /* succeeds if p is null */
```

# Pointers in Detail

Pointers have many but easy concepts and they are very important to C programming. The following important pointer concepts should be clear to any C programmer −

## C - Pointer arithmetic
A pointer in c is an address, which is a numeric value. Therefore, you can perform arithmetic operations on a pointer just as you can on a numeric value. There are four arithmetic operators that can be used on pointers: ++, --, +, and -

To understand pointer arithmetic, let us consider that ptr is an integer pointer which points to the address 1000. Assuming 32-bit integers, let us perform the following arithmetic operation on the pointer −
```c
ptr++
```
After the above operation, the ptr will point to the location 1004 because each time ptr is incremented, it will point to the next integer location which is 4 bytes next to the current location. This operation will move the pointer to the next memory location without impacting the actual value at the memory location. If ptr points to a character whose address is 1000, then the above operation will point to the location 1001 because the next character will be available at 1001.
Incrementing a Pointer

We prefer using a pointer in our program instead of an array because the variable pointer can be incremented, unlike the array name which cannot be incremented because it is a constant pointer. The following program increments the variable pointer to access each succeeding element of the array −
```c
#include <stdio.h>

const int MAX = 3;

int main () {

   int  var[] = {10, 100, 200};
   int  i, *ptr;

   /* let us have array address in pointer */
   ptr = var;
	
   for ( i = 0; i < MAX; i++) {

      printf("Address of var[%d] = %x\n", i, ptr );
      printf("Value of var[%d] = %d\n", i, *ptr );

      /* move to the next location */
      ptr++;
   }
	
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Address of var[0] = bf882b30
Value of var[0] = 10
Address of var[1] = bf882b34
Value of var[1] = 100
Address of var[2] = bf882b38
Value of var[2] = 200
```
### Decrementing a Pointer

The same considerations apply to decrementing a pointer, which decreases its value by the number of bytes of its data type as shown below −
```c
#include <stdio.h>

const int MAX = 3;

int main () {

   int  var[] = {10, 100, 200};
   int  i, *ptr;

   /* let us have array address in pointer */
   ptr = &var[MAX-1];
	
   for ( i = MAX; i > 0; i--) {

      printf("Address of var[%d] = %x\n", i-1, ptr );
      printf("Value of var[%d] = %d\n", i-1, *ptr );

      /* move to the previous location */
      ptr--;
   }
	
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Address of var[2] = bfedbcd8
Value of var[2] = 200
Address of var[1] = bfedbcd4
Value of var[1] = 100
Address of var[0] = bfedbcd0
Value of var[0] = 10
```
### Pointer Comparisons

Pointers may be compared by using relational operators, such as ==, <, and >. If p1 and p2 point to variables that are related to each other, such as elements of the same array, then p1 and p2 can be meaningfully compared.

The following program modifies the previous example − one by incrementing the variable pointer so long as the address to which it points is either less than or equal to the address of the last element of the array, which is &var[MAX - 1] −
```c
#include <stdio.h>

const int MAX = 3;

int main () {

   int  var[] = {10, 100, 200};
   int  i, *ptr;

   /* let us have address of the first element in pointer */
   ptr = var;
   i = 0;
	
   while ( ptr <= &var[MAX - 1] ) {

      printf("Address of var[%d] = %x\n", i, ptr );
      printf("Value of var[%d] = %d\n", i, *ptr );

      /* point to the next location */
      ptr++;
      i++;
   }
	
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Address of var[0] = bfdbcb20
Value of var[0] = 10
Address of var[1] = bfdbcb24
Value of var[1] = 100
Address of var[2] = bfdbcb28
Value of var[2] = 200
```

## C - Array of pointers
Before we understand the concept of arrays of pointers, let us consider the following example, which uses an array of 3 integers −
```c
#include <stdio.h>
 
const int MAX = 3;
 
int main () {

   int  var[] = {10, 100, 200};
   int i;
 
   for (i = 0; i < MAX; i++) {
      printf("Value of var[%d] = %d\n", i, var[i] );
   }
   
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Value of var[0] = 10
Value of var[1] = 100
Value of var[2] = 200
```
There may be a situation when we want to maintain an array, which can store pointers to an int or char or any other data type available. Following is the declaration of an array of pointers to an integer −
```
int *ptr[MAX];
```
It declares ptr as an array of MAX integer pointers. Thus, each element in ptr, holds a pointer to an int value. The following example uses three integers, which are stored in an array of pointers, as follows −
```c
#include <stdio.h>
 
const int MAX = 3;
 
int main () {

   int  var[] = {10, 100, 200};
   int i, *ptr[MAX];
 
   for ( i = 0; i < MAX; i++) {
      ptr[i] = &var[i]; /* assign the address of integer. */
   }
   
   for ( i = 0; i < MAX; i++) {
      printf("Value of var[%d] = %d\n", i, *ptr[i] );
   }
   
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```c
Value of var[0] = 10
Value of var[1] = 100
Value of var[2] = 200
```
You can also use an array of pointers to character to store a list of strings as follows −
```c
#include <stdio.h>
 
const int MAX = 4;
 
int main () {

   char *names[] = {
      "Zara Ali",
      "Hina Ali",
      "Nuha Ali",
      "Sara Ali"
   };
   
   int i = 0;

   for ( i = 0; i < MAX; i++) {
      printf("Value of names[%d] = %s\n", i, names[i] );
   }
   
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Value of names[0] = Zara Ali
Value of names[1] = Hina Ali
Value of names[2] = Nuha Ali
Value of names[3] = Sara Ali
```

## C - Pointer to Pointer
A pointer to a pointer is a form of multiple indirection, or a chain of pointers. Normally, a pointer contains the address of a variable. When we define a pointer to a pointer, the first pointer contains the address of the second pointer, which points to the location that contains the actual value as shown below.
![](img/c11.jpg)

A variable that is a pointer to a pointer must be declared as such. This is done by placing an additional asterisk in front of its name. For example, the following declaration declares a pointer to a pointer of type int −
```c
int **var;
```
When a target value is indirectly pointed to by a pointer to a pointer, accessing that value requires that the asterisk operator be applied twice, as is shown below in the example −
```c
#include <stdio.h>
 
int main () {

   int  var;
   int  *ptr;
   int  **pptr;

   var = 3000;

   /* take the address of var */
   ptr = &var;

   /* take the address of ptr using address of operator & */
   pptr = &ptr;

   /* take the value using pptr */
   printf("Value of var = %d\n", var );
   printf("Value available at *ptr = %d\n", *ptr );
   printf("Value available at **pptr = %d\n", **pptr);

   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Value of var = 3000
Value available at *ptr = 3000
Value available at **pptr = 3000
```

## Passing pointers to functions in C
C programming allows passing a pointer to a function. To do so, simply declare the function parameter as a pointer type.

Following is a simple example where we pass an unsigned long pointer to a function and change the value inside the function which reflects back in the calling function −
```c
#include <stdio.h>
#include <time.h>
 
void getSeconds(unsigned long *par);

int main () {

   unsigned long sec;
   getSeconds( &sec );

   /* print the actual value */
   printf("Number of seconds: %ld\n", sec );

   return 0;
}

void getSeconds(unsigned long *par) {
   /* get the current number of seconds */
   *par = time( NULL );
   return;
}
```
When the above code is compiled and executed, it produces the following result −
```
Number of seconds :1294450468
```
The function, which can accept a pointer, can also accept an array as shown in the following example −
```c
#include <stdio.h>
 
/* function declaration */
double getAverage(int *arr, int size);
 
int main () {

   /* an int array with 5 elements */
   int balance[5] = {1000, 2, 3, 17, 50};
   double avg;
 
   /* pass pointer to the array as an argument */
   avg = getAverage( balance, 5 ) ;
 
   /* output the returned value  */
   printf("Average value is: %f\n", avg );
   return 0;
}

double getAverage(int *arr, int size) {

   int  i, sum = 0;       
   double avg;          
 
   for (i = 0; i < size; ++i) {
      sum += arr[i];
   }
 
   avg = (double)sum / size;
   return avg;
}
```
When the above code is compiled together and executed, it produces the following result −
```
Average value is: 214.40000
```

## Return pointer from functions in C
We have seen in the last chapter how C programming allows to return an array from a function. Similarly, C also allows to return a pointer from a function. To do so, you would have to declare a function returning a pointer as in the following example −
```c
int * myFunction() {
   .
   .
   .
}
```
Second point to remember is that, it is not a good idea to return the address of a local variable outside the function, so you would have to define the local variable as static variable.

Now, consider the following function which will generate 10 random numbers and return them using an array name which represents a pointer, i.e., address of first array element.
```c
#include <stdio.h>
#include <time.h>
 
/* function to generate and return random numbers. */
int * getRandom( ) {

   static int  r[10];
   int i;
 
   /* set the seed */
   srand( (unsigned)time( NULL ) );
	
   for ( i = 0; i < 10; ++i) {
      r[i] = rand();
      printf("%d\n", r[i] );
   }
 
   return r;
}
 
/* main function to call above defined function */
int main () {

   /* a pointer to an int */
   int *p;
   int i;

   p = getRandom();
	
   for ( i = 0; i < 10; i++ ) {
      printf("*(p + [%d]) : %d\n", i, *(p + i) );
   }
 
   return 0;
}
```
When the above code is compiled together and executed, it produces the following result −
```
1523198053
1187214107
1108300978
430494959
1421301276
930971084
123250484
106932140
1604461820
149169022
*(p + [0]) : 1523198053
*(p + [1]) : 1187214107
*(p + [2]) : 1108300978
*(p + [3]) : 430494959
*(p + [4]) : 1421301276
*(p + [5]) : 930971084
*(p + [6]) : 123250484
*(p + [7]) : 106932140
*(p + [8]) : 1604461820
*(p + [9]) : 149169022
```


# Strings
Strings are actually one-dimensional array of characters terminated by a null character '\0'. Thus a null-terminated string contains the characters that comprise the string followed by a null.

The following declaration and initialization create a string consisting of the word "Hello". To hold the null character at the end of the array, the size of the character array containing the string is one more than the number of characters in the word "Hello."
```c
char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
```
If you follow the rule of array initialization then you can write the above statement as follows −
```
char greeting[] = "Hello";
```
Following is the memory presentation of the above defined string in C/C++ −

![](img/c12.jpg)

Actually, you do not place the null character at the end of a string constant. The C compiler automatically places the '\0' at the end of the string when it initializes the array. Let us try to print the above mentioned string −
```c
#include <stdio.h>

int main () {

   char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
   printf("Greeting message: %s\n", greeting );
   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Greeting message: Hello
```
C supports a wide range of functions that manipulate null-terminated strings −
```
Sr.No. 	Function & Purpose
1 	      strcpy(s1, s2);
         Copies string s2 into string s1.

2 	      strcat(s1, s2);
         Concatenates string s2 onto the end of string s1.

3 	      strlen(s1);
         Returns the length of string s1.

4 	      strcmp(s1, s2);
         Returns 0 if s1 and s2 are the same; less than 0 if s1<s2; greater than 0 if s1>s2.

5 	      strchr(s1, ch);
         Returns a pointer to the first occurrence of character ch in string s1.

6 	      strstr(s1, s2);
         Returns a pointer to the first occurrence of string s2 in string s1.
```
The following example uses some of the above-mentioned functions −
```c
#include <stdio.h>
#include <string.h>

int main () {

   char str1[12] = "Hello";
   char str2[12] = "World";
   char str3[12];
   int  len ;

   /* copy str1 into str3 */
   strcpy(str3, str1);
   printf("strcpy( str3, str1) :  %s\n", str3 );

   /* concatenates str1 and str2 */
   strcat( str1, str2);
   printf("strcat( str1, str2):   %s\n", str1 );

   /* total lenghth of str1 after concatenation */
   len = strlen(str1);
   printf("strlen(str1) :  %d\n", len );

   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
strcpy( str3, str1) :  Hello
strcat( str1, str2):   HelloWorld
strlen(str1) :  10
```

# Structures
Arrays allow to define type of variables that can hold several data items of the same kind. Similarly structure is another user defined data type available in C that allows to combine data items of different kinds.

Structures are used to represent a record. Suppose you want to keep track of your books in a library. You might want to track the following attributes about each book −
```
    Title
    Author
    Subject
    Book ID
```
## Defining a Structure
To define a structure, you must use the struct statement. The struct statement defines a new data type, with more than one member. The format of the struct statement is as follows −
```c
struct [structure tag] {

   member definition;
   member definition;
   ...
   member definition;
} [one or more structure variables];  
```
The structure tag is optional and each member definition is a normal variable definition, such as int i; or float f; or any other valid variable definition. At the end of the structure's definition, before the final semicolon, you can specify one or more structure variables but it is optional. Here is the way you would declare the Book structure −
```c
struct Books {
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
} book;  
```

## Accessing Structure Members
To access any member of a structure, we use the member access operator (.). The member access operator is coded as a period between the structure variable name and the structure member that we wish to access. You would use the keyword struct to define variables of structure type. The following example shows how to use a structure in a program −
```c
#include <stdio.h>
#include <string.h>
 
struct Books {
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
};
 
int main( ) {

   struct Books Book1;        /* Declare Book1 of type Book */
   struct Books Book2;        /* Declare Book2 of type Book */
 
   /* book 1 specification */
   strcpy( Book1.title, "C Programming");
   strcpy( Book1.author, "Nuha Ali"); 
   strcpy( Book1.subject, "C Programming Tutorial");
   Book1.book_id = 6495407;

   /* book 2 specification */
   strcpy( Book2.title, "Telecom Billing");
   strcpy( Book2.author, "Zara Ali");
   strcpy( Book2.subject, "Telecom Billing Tutorial");
   Book2.book_id = 6495700;
 
   /* print Book1 info */
   printf( "Book 1 title : %s\n", Book1.title);
   printf( "Book 1 author : %s\n", Book1.author);
   printf( "Book 1 subject : %s\n", Book1.subject);
   printf( "Book 1 book_id : %d\n", Book1.book_id);

   /* print Book2 info */
   printf( "Book 2 title : %s\n", Book2.title);
   printf( "Book 2 author : %s\n", Book2.author);
   printf( "Book 2 subject : %s\n", Book2.subject);
   printf( "Book 2 book_id : %d\n", Book2.book_id);

   return 0;
}
```
When the above code is compiled and executed, it produces the following result −
```
Book 1 title : C Programming
Book 1 author : Nuha Ali
Book 1 subject : C Programming Tutorial
Book 1 book_id : 6495407
Book 2 title : Telecom Billing
Book 2 author : Zara Ali
Book 2 subject : Telecom Billing Tutorial
Book 2 book_id : 6495700
```
## Structures as Function Arguments
You can pass a structure as a function argument in the same way as you pass any other variable or pointer.
```
#include <stdio.h>
#include <string.h>

struct Books {
   char  title[50]
   char  author[50]
   char  subject[100]
   int  book_id;
};

/* function declaration */
void printBook( struct Books book );

int main() {

   struct Books Book1;        /* Declare Book1 of type Book */
   struct Books Book2;        /* Declare Book2 of type Book */

   /* book 1 specs */
   strcpy( Book1.title, "C Programming");
   strcpy( Book1.author, "Nuha Ali");
   strcpy( Book1.subject, "C Programming Tutorial");
   Book1.book_id = 6495407;

   /* book 2 specs */
   strcpy( Book2.title, "Telecom Billing");
   strcpy( Book2.author, "Zara Ali");
   strcpy( Book2.subject, "Telecom Billing Tutorial");
   Book1.book_id = 6495700;

   /* print Book1 info */
   printBook( Book1 );

   /* print Book2 info */
   printBook( Book2 );

   return 0;
}

void printBook( struct Books book ) {

   printf( "Book title : %s\n", book.title);
   printf( "Book author : %s\n", book.author);
   printf( "Book subject : %s\n", book.subject);
   printf( "Book bbook_id : %s\n", book.book_id);
}
```

#

#

#

#