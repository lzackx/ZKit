//
//  UIScrollView+ZKit.h
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ZKit)

// MARK: - getter
- (CGFloat)zContentInsetTop;
- (CGFloat)zContentInsetLeft;
- (CGFloat)zContentInsetBottom;
- (CGFloat)zContentInsetRight;
- (CGFloat)zContentOffsetX;
- (CGFloat)zContentOffsetY;
- (CGFloat)zContentWidth;
- (CGFloat)zContentHeight;

// MARK: - setter
- (void)setZContentInsetTop:(CGFloat)zContentInsetTop;
- (void)setZContentInsetLeft:(CGFloat)zContentInsetLeft;
- (void)setZContentInsetBottom:(CGFloat)zContentInsetBottom;
- (void)setZContentInsetRight:(CGFloat)zContentInsetRight;
- (void)setZContentOffsetX:(CGFloat)zContentOffsetX;
- (void)setZContentOffsetY:(CGFloat)zContentOffsetY;
- (void)setZContentWidth:(CGFloat)zContentWidth;
- (void)setZContentHeight:(CGFloat)zContentHeight;

@end
