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
    
    NSSet<NSNumber *> *setTrueIndex = [NSSet setWithArray:@[
        @15, @16, @19, @22, @42, @16
    ]];
    
    NSSet<NSNumber *> *setFalseIndex = [NSSet setWithArray:@[
        @14, @15, @17, @19, @29, @21, @42
    ]];
    

    KTBitArray *bitArray = [[KTBitArray alloc] initWithBitCount:count];
    XCTAssert(bitArray.count == count, @"error in setting bit count");
    
    [setTrueIndex enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        [bitArray setValue:true atIndex:obj.unsignedIntegerValue];
    }];
    
    XCTAssert(setTrueIndex.count == bitArray.trueCount, @"%zd != %zd", setTrueIndex.count, bitArray.trueCount);
    
    [bitArray setValue:true atIndex:16];

    XCTAssert(setTrueIndex.count == bitArray.trueCount, @"%zd != %zd", setTrueIndex.count, bitArray.trueCount);
    
    for (NSUInteger i = 0; i < count; i++) {
        BOOL valueToCompare = ([setTrueIndex containsObject:@(i)]) ? true : false;
        BOOL value = [bitArray valueAtIndex:i];
        XCTAssert(valueToCompare == value, @"%d != %d(%zd)", valueToCompare, value, i);
    }
    
    [setFalseIndex enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        [bitArray setValue:false atIndex:obj.unsignedIntegerValue];
    }];
    
    for (NSUInteger i = 0; i < count; i++) {
        BOOL valueToCompare = ([setTrueIndex containsObject:@(i)]) ? true : false;
        if ([setFalseIndex containsObject:@(i)]) {
            valueToCompare = false;
        }
        BOOL value = [bitArray valueAtIndex:i];
        XCTAssert(valueToCompare == value, @"%d != %d(%zd)", valueToCompare, value, i);
    }
    
    NSMutableSet *intersect = [NSMutableSet setWithSet:setTrueIndex];
    [intersect intersectSet:setFalseIndex];
    
    XCTAssert((setTrueIndex.count - intersect.count) == bitArray.trueCount, @"%zd != %zd", setTrueIndex.count, bitArray.trueCount);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
