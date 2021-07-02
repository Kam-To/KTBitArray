//
//  Tests.m
//  Tests
//
//  Created by Kam on 2021/7/2.
//

#import <XCTest/XCTest.h>
#import "KTBitArray.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    NSUInteger count = 50;
    KTBitArray *bitArray = [[KTBitArray alloc] initWithBitCount:count];
    XCTAssert(bitArray.count == count, @"error in setting bit count");
    
    NSSet<NSNumber *> *setTrueIndex = [NSSet setWithArray:@[
        @15, @16, @19, @22, @42, @16
    ]];
    
    [setTrueIndex enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        [bitArray setValue:true atIndex:obj.unsignedIntegerValue];
    }];
    
    for (NSUInteger i = 0; i < count; i++) {
        BOOL valueToCompare = ([setTrueIndex containsObject:@(i)]) ? true : false;
        BOOL value = [bitArray valueAtIndex:i];
        XCTAssert(valueToCompare == value, @"%d == %d(%zd)", valueToCompare, value, i);
    }
    
    NSSet<NSNumber *> *setFalseIndex = [NSSet setWithArray:@[
        @14, @15, @17, @29, @21, @42
    ]];
    
    [setFalseIndex enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        [bitArray setValue:false atIndex:obj.unsignedIntegerValue];
    }];
    
    for (NSUInteger i = 0; i < count; i++) {
        BOOL valueToCompare = ([setTrueIndex containsObject:@(i)]) ? true : false;
        if ([setFalseIndex containsObject:@(i)]) {
            valueToCompare = false;
        }
        BOOL value = [bitArray valueAtIndex:i];
        XCTAssert(valueToCompare == value, @"%d == %d(%zd)", valueToCompare, value, i);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
