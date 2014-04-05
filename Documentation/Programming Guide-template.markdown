Programming Guide
-----------------

This programming guide serves as a reference on how to go about using the included api.

Table of Contents
-----------------

[Integer Checks](#IntegerChecks)

[Division Operations](#DivisionOperations)


<a name="IntegerChecks"></a>
Integer Checks
--------------

Contains:

[isWholeNumber](#isWholeNumber)

[isEven](#isEven)

[isOdd](#isOdd)


<a name="isWholeNumber"></a>
### isWholeNumber

Checks if the number is whole or not.

```
NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:@"64"];
    
BOOL isWholeNumber = [JOEMath isWholeNumber:number];

```

<a name="isEven"></a>
### isEven

Checks if the number is even or not.

```
NSUInteger integer = 64;
    
BOOL isEvenNumber = [JOEMath isEven:integer];
```

<a name="isOdd"></a>
### isOdd

Checks if the number is odd or not.

```
NSUInteger integer = 65;
    
BOOL isOddNumber = [JOEMath isOdd:integer];
```

<a name="DivisionOperations"></a>
Division Operations
-------------------

Contains:

[isDivisibleBy](#isDivisibleBy)

<a name="isDivisibleBy"></a>
### isDivisibleBy

Checks if number is divisible by all divisors in a set.

```
NSSet *numbers = [NSSet setWithObjects:@(6), @(12), @(18), @(144), nil];
[JOEMath integer:288 isDivisibleByDivisorsInSet:numbers];
```

Returns YES, because 288 is in fact divisible by all the numbers in the given set.
