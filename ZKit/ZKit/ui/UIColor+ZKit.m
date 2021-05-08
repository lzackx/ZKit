//
//  UIColor+ZKit.m
//  ZKit
//
//  Created by lzackx on 2018/7/6.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "UIColor+ZKit.h"

@implementation UIColor (ZKit)

+ (UIColor *)zColorWithHex:(NSString *)hex {
    NSString *colorHex = [[hex stringByReplacingOccurrencesOfString:@"#"
                                                         withString:@""]
                          uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorHex length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self zColorComponentFromHex: colorHex start: 0 length: 1];
            green = [self zColorComponentFromHex: colorHex start: 1 length: 1];
            blue  = [self zColorComponentFromHex: colorHex start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self zColorComponentFromHex: colorHex start: 0 length: 1];
            red   = [self zColorComponentFromHex: colorHex start: 1 length: 1];
            green = [self zColorComponentFromHex: colorHex start: 2 length: 1];
            blue  = [self zColorComponentFromHex: colorHex start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self zColorComponentFromHex: colorHex start: 0 length: 2];
            green = [self zColorComponentFromHex: colorHex start: 2 length: 2];
            blue  = [self zColorComponentFromHex: colorHex start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self zColorComponentFromHex: colorHex start: 0 length: 2];
            red   = [self zColorComponentFromHex: colorHex start: 2 length: 2];
            green = [self zColorComponentFromHex: colorHex start: 4 length: 2];
            blue  = [self zColorComponentFromHex: colorHex start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hex];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat)zColorComponentFromHex:(NSString *)hex start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [hex substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
