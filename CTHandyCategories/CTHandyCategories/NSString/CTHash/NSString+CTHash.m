//
//  NSString+CTHash.m
//  CTHandyCategories
//
//  Created by casa on 2018/3/7.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "NSString+CTHash.h"
#include <CommonCrypto/CommonDigest.h>

@implementation NSString (CTHash)

- (NSString *)ct_MD5
{
    NSData* inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([inputData bytes], (unsigned int)[inputData length], outputData);
    
    NSMutableString* hashStr = [NSMutableString string];
    int i = 0;
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
        [hashStr appendFormat:@"%02x", outputData[i]];
    
    return hashStr;
}

@end
