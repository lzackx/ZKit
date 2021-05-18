//
//  NSString+ZKit.m
//  ZKit
//
//  Created by lzackx on 2018/7/13.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "NSString+ZKit.h"

@implementation NSString (ZKit)

- (NSString *)localizedString {
    return NSLocalizedString(self, nil);
}

- (NSString *)localizedStringWithComment:(NSString *)comment {
    return NSLocalizedString(self, comment);
}

- (NSString *)localizedStringFromTable:(NSString *)table {
    return NSLocalizedStringFromTable(self, table, nil);
}

- (NSString *)localizedStringFromTable:(NSString *)table withComment:(NSString *)comment {
    return NSLocalizedStringFromTable(self, table, comment);
}

- (NSString *)localizedStringFromTable:(NSString *)table inBundle:(NSBundle *)bundle {
    return NSLocalizedStringFromTableInBundle(self, table, bundle, nil);
}

- (NSString *)localizedStringFromTable:(NSString *)table inBundle:(NSBundle *)bundle withComment:(NSString *)comment {
    return NSLocalizedStringFromTableInBundle(self, table, bundle, comment);
}

@end
