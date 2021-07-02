//
//  KTBitArray.m
//  KTBitArray
//
//  Created by Kam on 2021/7/2.
//

#import "KTBitArray.h"

@interface KTBitArray() {
    Byte *_region;
    NSUInteger _bitCount;
}
@end

static const size_t byteSize = 8;
@implementation KTBitArray
- (instancetype)initWithBitCount:(NSUInteger)bitCount {
    if (self = [super init]) {
        _bitCount = bitCount;
        size_t byteRequired = bitCount / byteSize + ((bitCount % byteSize) > 0 ? 1 : 0);
        _region = malloc(byteRequired);
        if (_region == NULL) return nil;
    }
    return self;
}

- (NSUInteger)count {
    return _bitCount;
}

- (BOOL)valueAtIndex:(NSUInteger)index {
    if (index >= _bitCount) @throw [self p_outOfBoundsExcpetion:index];
    NSUInteger byteIdx = index / byteSize;
    Byte byte = _region[byteIdx];
    int shift = (index % byteSize);
    BOOL result = (byte & (1 << shift)) >> shift;
    return result;
}

- (void)setValue:(BOOL)value atIndex:(NSUInteger)index {
    if (index >= _bitCount) @throw [self p_outOfBoundsExcpetion:index];
    NSUInteger byteIdx = index / byteSize;
    Byte byte = _region[byteIdx];
    int shift = (index % byteSize);
    Byte newByte = (~(1 << shift) & byte) | (value << shift);
    _region[byteIdx] = newByte;
}

- (void)dealloc {
    if (_region) {
        free(_region);
        _region = NULL;
        _bitCount = 0;
    }
}

- (NSException *)p_outOfBoundsExcpetion:(NSUInteger)index {
    NSString *reason = [NSString stringWithFormat:@"index %zd beyond bounds for empty", index];
    return [NSException exceptionWithName:@"KTBitArrayException" reason:reason userInfo:nil];
}

@end
