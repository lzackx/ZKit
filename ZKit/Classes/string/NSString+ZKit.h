//
//  NSString+ZKit.h
//  ZKit
//
//  Created by lzackx on 2018/7/13.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZKit)

- (NSString *)localizedString;
- (NSString *)localizedStringWithComment:(NSString *)comment;
- (NSString *)localizedStringFromTable:(NSString *)table;
- (NSString *)localizedStringFromTable:(NSString *)table withComment:(NSString *)comment;
- (NSString *)localizedStringFromTable:(NSString *)table inBundle:(NSBundle *)bundle;
- (NSString *)localizedStringFromTable:(NSString *)table inBundle:(NSBundle *)bundle withComment:(NSString *)comment;

@end

NS_ASSUME_NONNULL_END
