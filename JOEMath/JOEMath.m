//
//  JOEMath.m
//
//  Version 0.1.0
//
//  Created by Joseph Collins on 3/21/14.
//
//  Distributed under The MIT License (MIT)
//  Get the latest version here:
//
//  http://www.github.com/ijoecollins/JOEMath
//
//  Copyright (c) 2014 Joseph Collins.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "JOEMath.h"

@implementation JOEMath

#pragma mark - Integer Checks

+ (BOOL)isEven:(NSInteger)integer
{
    if (integer & 1) {
        return NO;
    }
    
    return YES;
}


+ (BOOL)isOdd:(NSInteger)integer
{
    if (integer & 1) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isWholeNumber:(NSDecimalNumber *)decimal
{
    NSDecimal value = [decimal decimalValue];
    
    if (NSDecimalIsNotANumber(&value)) {
        return NO;
    }
    
    NSDecimal rounded;
    NSDecimalRound(&rounded, &value, 0, NSRoundPlain);
    
    return NSDecimalCompare(&rounded, &value) == NSOrderedSame;
}


#pragma mark - Division Operations

+ (BOOL)integer:(NSInteger)integer isDivisibleByDivisorsInSet:(NSSet *)set
{
    __block BOOL isDivisible;
    
    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithDecimal:[(NSNumber *)obj decimalValue]];
        NSDecimalNumber *dividend = [[NSDecimalNumber alloc] initWithInteger:integer];
        NSDecimalNumber *result = [dividend decimalNumberByDividingBy:divisor];
        
        isDivisible = [self isWholeNumber:result];
        
        if (isDivisible == NO) {
            *stop = YES;
        }
    }];
    
    return isDivisible;
}

@end