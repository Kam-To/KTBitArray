//
//  KTBitArray.h
//  KTBitArray
//
//  Created by Kam on 2021/7/2.
//

#import <Foundation/Foundation.h>

@interface KTBitArray : NSObject
- (nullable instancetype)initWithBitCount:(NSUInteger)bitCount;
- (NSUInteger)count;
- (BOOL)valueAtIndex:(NSUInteger)index;
- (void)setValue:(BOOL)value atIndex:(NSUInteger)index;
@end
