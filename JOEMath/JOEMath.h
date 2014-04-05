//
//  JOEMath.h
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

#import <Foundation/Foundation.h>

#pragma mark - JOEMath Interface

/*!  A collection of methods ranging from simple to complex mathematical operations that have been aggregated from development over time.
*/

@interface JOEMath : NSObject


///-------------------------------
/// @name Integer Checks
///-------------------------------

/*! Method checks the wholeness of a decimal value. 

    @param decimal Decimal number to be checked.
    @return        Returns YES indicating the value is in fact a whole number.
*/

+ (BOOL)isWholeNumber:(NSDecimalNumber *)decimal;

/*! Determines if the integer is even.
 
    @param integer NSUInteger to be checked.
    @return        If YES, the value is even.
*/

+ (BOOL)isEven:(NSUInteger)integer;

/*! Determines if the integer is odd.
 
    @param integer NSUInteger to be checked.
    @return        If YES, the value is odd.
*/

+ (BOOL)isOdd:(NSUInteger)integer;


///-------------------------------
/// @name Division Operations
///-------------------------------

/*! Determines if a given integer is divisible by all the divisors in a passed in set.
 
    @param integer The integer dividend.
    @param set     A character set composed of integer divisors.
    @return        If YES, the integer is divisible by all the divisors in the set. If NO, it may be divisble by some, or none at all.
*/

+ (BOOL)integer:(NSInteger)integer isDivisibleByDivisorsInSet:(NSSet *)set;

@end
