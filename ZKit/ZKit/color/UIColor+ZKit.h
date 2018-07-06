//
//  UIColor+ZKit.h
//  ZKit
//
//  Created by lzackx on 2018/7/6.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define Z_RED       @"#FF66CC"
#define Z_YELLOW    @"#FFCC66"
#define Z_GREEN     @"#66FFCC"
#define Z_CYAN      @"#CCFF66"
#define Z_PURPLE    @"#CC66FF"
#define Z_BLUE      @"#66CCFF"

@interface UIColor (ZKit)

+ (UIColor *)zColorWithHex:(NSString *)hex;
+ (CGFloat)zColorComponentFromHex:(NSString *)hex start:(NSUInteger)start length:(NSUInteger)length;

@end

NS_ASSUME_NONNULL_END
