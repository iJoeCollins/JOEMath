//
//  MathTests.m
//  MathTests
//
//  Created by Joseph Collins on 3/20/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "JOEMath.h"

@interface JOEMathTests : XCTestCase

@end

@implementation JOEMathTests

- (void)testIsAWholeNumber {
    
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:@"64"];
    
    BOOL isWholeNumber = [JOEMath isWholeNumber:number];
    
    XCTAssertTrue(isWholeNumber, @"%@ is a whole number.", [number stringValue]);
}

- (void)testIsAEvenNumber {
    NSUInteger integer = 64;
    
    BOOL isEvenNumber = [JOEMath isEven:integer];
    
    XCTAssertTrue(isEvenNumber, @"%lu is an even number.", (unsigned long)integer);
    
    integer = 65;
    
    isEvenNumber = [JOEMath isEven:integer];
    
    XCTAssertFalse(isEvenNumber, @"%lu is not an even number.", (unsigned long)integer);
}

- (void)testIsAOddNumber {
    NSUInteger integer = 65;
    
    BOOL isOddNumber = [JOEMath isOdd:integer];
    
    XCTAssertTrue(isOddNumber, @"%lu is an odd number.", (unsigned long)integer);
    
    integer = 64;
    
    isOddNumber = [JOEMath isOdd:integer];
    
    XCTAssertFalse(isOddNumber, @"%lu is not an odd number.", (unsigned long)integer);
}

- (void)testAllValuesAreDivisibleByNumber {
    
    NSSet *numbers = [NSSet setWithObjects:@(6), @(12), @(18), @(144), nil];
    
    __block NSMutableString *numbersPrint = [[NSMutableString alloc] init];
    [numbers enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [numbersPrint appendFormat:@"%@, ", obj];
    }];
    
    XCTAssertTrue([JOEMath integer:288 isDivisibleByDivisorsInSet:numbers], @"%@ are not all divisible by %d", numbersPrint, 288);
    
}

@end
