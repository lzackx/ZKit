//
//  ZKit+sysctl.m
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "ZKit+sysctl.h"
#import <sys/sysctl.h>


@implementation ZKit (sysctl)

+ (int)sysctlByName:(char *)name {
    
    size_t size = -1;
    int val = 0;
    
    if (!name) {
        ZLog(@"name == NULL");
        return -1;
    }
    
    if (strlen(name) == 0) {
        ZLog(@"strlen(name) == 0");
        return -1;
    }
    
    if (sysctlbyname(name, NULL, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname size with name '%s' has failed: %s", name, strerror(errno));
        return -1;
    }
    
    if (size == -1) {
        ZLog(@"sysctlbyname with name '%s' returned invalid size", name);
        return -1;
    }
    
    if (sysctlbyname(name, &val, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname value with name '%s' has failed: %s", name, strerror(errno));
        return -1;
    }
    
    return val;
}

+ (uint64_t)sysctl64ByName:(char *)name {
    
    size_t size = -1;
    uint64_t val = 0;
    
    if (!name) {
        ZLog(@"name == NULL");
        return -1;
    }
    
    if (strlen(name) == 0) {
        ZLog(@"strlen(name) == 0");
        return -1;
    }
    
    if (sysctlbyname(name, NULL, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname size with name '%s' has failed: %s", name, strerror(errno));
        return -1;
    }
    
    if (size == -1) {
        ZLog(@"sysctlbyname with name '%s' returned invalid size", name);
        return -1;
    }
    
    if (sysctlbyname(name, &val, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname value with name '%s' has failed: %s", name, strerror(errno));
        return -1;
    }
    
    return val;
}

+ (NSString *)sysctlChrByName:(char *)name {
    
    size_t size = -1;
    char *val;
    NSString *result = @"";
    
    if (!name) {
        ZLog(@"name == NULL");
        return result;
    }
    
    if (strlen(name) == 0) {
        ZLog(@"strlen(name) == 0");
        return result;
    }
    
    if (sysctlbyname(name, NULL, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname size with name '%s' has failed: %s", name, strerror(errno));
        return result;
    }
    
    if (size == -1) {
        ZLog(@"sysctlbyname with name '%s' returned invalid size", name);
        return result;
    }
    
    val = (char *)malloc(size);
    
    if (sysctlbyname(name, val, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname value with name '%s' has failed: %s", name, strerror(errno));
        free(val);
        return result;
    }
    
    result = [NSString stringWithUTF8String:val];
    free(val);
    return result;
}

+ (void *)sysctlPtrByName:(char *)name pointer:(void *)ptr size:(size_t)size {
    
    if (!name) {
        ZLog(@"name == NULL");
        return nil;
    }
    if (strlen(name) == 0) {
        ZLog(@"strlen(name) == 0");
        return nil;
    }
    
    if (sysctlbyname(name, ptr, &size, NULL, 0) == -1) {
        ZLog(@"sysctlbyname value with name '%s' has failed: %s", name, strerror(errno));
        return nil;
    }
    
    return ptr;
}

@end


