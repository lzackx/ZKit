//
//  UIScrollView+ZKit.m
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "UIScrollView+ZKit.h"

@implementation UIScrollView (ZKit)

// MARK: - getter
- (CGFloat)zContentInsetTop {
    return self.contentInset.top;
}

- (CGFloat)zContentInsetLeft {
    return self.contentInset.left;
}

- (CGFloat)zContentInsetBottom {
    return self.contentInset.bottom;
}

- (CGFloat)zContentInsetRight {
    return self.contentInset.right;
}

- (CGFloat)zContentOffsetX {
    return self.contentOffset.x;
}

- (CGFloat)zContentOffsetY {
    return self.contentOffset.y;
}

- (CGFloat)zContentWidth {
    return self.contentSize.width;
}

- (CGFloat)zContentHeight {
    return self.contentSize.height;
}

// MARK: - setter
- (void)setZContentInsetTop:(CGFloat)zContentInsetTop {
    UIEdgeInsets insets = self.contentInset;
    insets.top = zContentInsetTop;
    self.contentInset = insets;
}

- (void)setZContentInsetLeft:(CGFloat)zContentInsetLeft {
    UIEdgeInsets insets = self.contentInset;
    insets.left = zContentInsetLeft;
    self.contentInset = insets;
}

- (void)setZContentInsetBottom:(CGFloat)zContentInsetBottom {
    UIEdgeInsets insets = self.contentInset;
    insets.bottom = zContentInsetBottom;
    self.contentInset = insets;
}

- (void)setZContentInsetRight:(CGFloat)zContentInsetRight {
    UIEdgeInsets insets = self.contentInset;
    insets.right = zContentInsetRight;
    self.contentInset = insets;
}

- (void)setZContentOffsetX:(CGFloat)zContentOffsetX {
    CGPoint offset = self.contentOffset;
    offset.x = zContentOffsetX;
    self.contentOffset = offset;
}

- (void)setZContentOffsetY:(CGFloat)zContentOffsetY {
    CGPoint offset = self.contentOffset;
    offset.y = zContentOffsetY;
    self.contentOffset = offset;
}

- (void)setZContentWidth:(CGFloat)zContentWidth {
    CGSize size = self.contentSize;
    size.width = zContentWidth;
    self.contentSize = size;
}

- (void)setZContentHeight:(CGFloat)zContentHeight {
    CGSize size = self.contentSize;
    size.height = zContentHeight;
    self.contentSize = size;
}

@end










