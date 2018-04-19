//
//  ZKit.h
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ZKit.
FOUNDATION_EXPORT double ZKitVersionNumber;

//! Project version string for ZKit.
FOUNDATION_EXPORT const unsigned char ZKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ZKit/PublicHeader.h>

#ifdef DEBUG
#define ZLog(format, ...) NSLog(format, __VA_ARGS__)
#else
#define ZLog(format, ...)
#endif

#import "UIView+ZKit.h"
#import "UIScrollView+ZKit.h"
