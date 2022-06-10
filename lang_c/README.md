
# Main Resources
https://www.tutorialspoint.com/cprogramming/c_header_files.htm  

## Supplemental Resources
foo


# Integer Types
```
Type	         Storage size	                      Value range  
char	           1 byte	                              -128 to 127 or 0 to 255  
unsigned char	  1 byte	                              0 to 255  
signed char	     1 byte	                              -128 to 127  
int	           2 or 4 bytes	                        -32,768 to 32,767 or -2,147,483,648 to 2,147,483,647  
unsigned int	  2 or 4 bytes	                        0 to 65,535 or 0 to 4,294,967,295  
short	           2 bytes	                           -32,768 to 32,767  
unsigned short	  2 bytes	                           0 to 65,535  
long	           8 bytes or (4bytes for 32 bit OS)	   -9223372036854775808 to 9223372036854775807  
unsigned long	  8 bytes	                           0 to 18446744073709551615
```

## Exact size on a platform
```
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
```
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
```
{
    int mount;
    auto int month;
}
```

## register
The register storage class is used to define local vars that should be stored in a reg instead of RAM. This means that the variable has a maximum size equal to the reg size (usually one word) and can't have the unary '&' operator applied to it (as it does not have a mem location).
```
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
```
#include <stdio.h>
 
int count ;
extern void write_extern();
 
main() {
   count = 5;
   write_extern();
}
```
**Second File: support.c**
```
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
```
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
```
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
```
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
```
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
```
for ( init; condition; increment ) {

for ( init; condition; increment ) {
statement(s);
}
statement(s);
}
```
The syntax for a nested while loop statement in C programming language is as follows −
```
while(condition) {

while(condition) {
statement(s);
}
statement(s);
}
```
The syntax for a nested do...while loop statement in C programming language is as follows −
```
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
```
break;
```
### Flow Diagram
![](img/c07.jpg "")

## Continue Statements
The continue statement in C programming works somewhat like the break statement. Instead of forcing termination, it forces the next iteration of the loop to take place, skipping any code in between.

For the for loop, continue statement causes the conditional test and increment portions of the loop to execute. For the while and do...while loops, continue statement causes the program control to pass to the conditional tests.

The syntax for a continue statement in C is as follows −
```
continue;
```
### Flow Diagram
![](img/c08.jpg "")

## Goto Statements
A goto statement in C programming provides an unconditional jump from the 'goto' to a labeled statement in the same function.

NOTE − Use of goto statement is highly discouraged in any programming language because it makes difficult to trace the control flow of a program, making the program hard to understand and hard to modify. Any program that uses a goto can be rewritten to avoid them.

The syntax for a goto statement in C is as follows −
```
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
```
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
```
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
```
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
```
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

```
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

```
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
```
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

```
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
```
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
```
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

```
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

```
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
int	0
char	        '\0'
float	        0
double	        0
pointer	        NULL
```
**It is a good programming practice to initialize variables properly, otherwise your program may produce unexpected results, because uninitialized variables will take some garbage value already available at their memory location.**
#

#

#