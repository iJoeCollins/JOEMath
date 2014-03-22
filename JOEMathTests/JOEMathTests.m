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

- (void)testAllValuesAreDivisibleByNumber {
    
    NSSet *numbers = [NSSet setWithObjects:@(6), @(12), @(18), @(144), nil];
    
    __block NSMutableString *numbersPrint = [[NSMutableString alloc] init];
    [numbers enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [numbersPrint appendFormat:@"%@, ", obj];
    }];
    
    XCTAssertTrue([JOEMath integer:288 isDivisibleByDivisorsInSet:numbers], @"%@ are not all divisible by %d", numbersPrint, 288);
    
}

@end
