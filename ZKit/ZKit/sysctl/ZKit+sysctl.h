//
//  ZKit+sysctl.h
//  ZKit
//
//  Created by lzackx on 2018/7/2.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "ZKit.h"


@interface ZKit (sysctl)

+ (uint64_t)sysctl64ByName:(char *)name;
+ (NSString *)sysctlChrByName:(char *)name;
+ (void *)sysctlPtrByName:(char *)name pointer:(void *)ptr size:(size_t)size;

@end
