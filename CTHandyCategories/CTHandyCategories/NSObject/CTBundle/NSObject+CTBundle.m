//
//  NSObject+CTBundle.m
//  CTHandyCategories
//
//  Created by casa on 2018/3/7.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "NSObject+CTBundle.h"

@implementation NSObject (CTBundle)

- (NSBundle *)ct_bundleWithName:(NSString *)bundleName
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    if (!bundlePath) {
        bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle" inDirectory:@"Frameworks"];
    }
    if (!bundlePath) {
        bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle" inDirectory:[NSString stringWithFormat:@"Frameworks/%@.framework", bundleName]];
    }
    return [NSBundle bundleWithPath:bundlePath];
}

@end
