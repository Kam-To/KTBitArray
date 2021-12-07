//
//  KTBitArray.h
//  KTBitArray
//
//  Created by Kam on 2021/7/2.
//

#import <Foundation/Foundation.h>

@interface KTBitArray : NSObject
- (nullable instancetype)initWithBitCount:(NSUInteger)bitCount __attribute__((objc_direct));
- (NSUInteger)count __attribute__((objc_direct));
- (NSUInteger)trueCount __attribute__((objc_direct));
- (NSUInteger)falseCount __attribute__((objc_direct));
- (BOOL)valueAtIndex:(NSUInteger)index __attribute__((objc_direct));
- (void)setValue:(BOOL)value atIndex:(NSUInteger)index __attribute__((objc_direct));
@end
