# KTBitArray
An array data structure that compactly stores bits. Each bucket in array can only store two state since it only takes one bit storage.

# Usage

Initial a bit array store fixed number bit, and do getter and setter for specific index, or get the true/false count.

```objc
KTBitArray *bitArray = [[KTBitArray alloc] initWithBitCount:79999];

[bitArray setValue:true atIndex:17];

BOOL value = [bitArray valueAtIndex:17];

NSUInteger trueCount = [bitArray trueCount];
```
