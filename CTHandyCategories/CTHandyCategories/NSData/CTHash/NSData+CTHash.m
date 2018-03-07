//
//  NSData+CTHash.m
//  CTHandyCategories
//
//  Created by casa on 2018/3/7.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "NSData+CTHash.h"
#include <CommonCrypto/CommonDigest.h>

@implementation NSData (CTHash)

- (NSData *)ct_MD5
{
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (unsigned int)[self length], outputData);
    NSData *result = [NSData dataWithBytes:outputData length:CC_MD5_DIGEST_LENGTH];
    return result;
    

}

@end
