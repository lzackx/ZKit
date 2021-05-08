//
//  UIView+ZKit.m
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import "UIView+ZKit.h"

@implementation UIView (ZKit)

// MARK: - getter
- (CGFloat)zX {
    return self.frame.origin.x;
}

- (CGFloat)zY {
    return self.frame.origin.y;
}

- (CGFloat)zCenterX {
    return self.center.x;
}

- (CGFloat)zCenterY {
    return self.center.y;
}

- (CGFloat)zWidth {
    return self.frame.size.width;
}

- (CGFloat)zHeight {
    return self.frame.size.height;
}

- (CGSize)zSize {
    return self.frame.size;
}

- (CGPoint)zOrigin {
    return self.frame.origin;
}

// MARK: - setter
- (void)setZX:(CGFloat)zX {
    CGRect frame = self.frame;
    frame = CGRectMake(zX,
                       self.frame.origin.y,
                       self.frame.size.width,
                       self.frame.size.height);
    self.frame = frame;
}

- (void)setZY:(CGFloat)zY {
    CGRect frame = self.frame;
    frame = CGRectMake(self.frame.origin.x,
                       zY,
                       self.frame.size.width,
                       self.frame.size.height);
    self.frame = frame;
}

- (void)setZWidth:(CGFloat)zWidth {
    CGRect frame = self.frame;
    frame = CGRectMake(self.frame.origin.x,
                       self.frame.origin.y,
                       zWidth,
                       self.frame.size.height);
    self.frame = frame;
}

- (void)setZHeight:(CGFloat)zHeight {
    CGRect frame = self.frame;
    frame = CGRectMake(self.frame.origin.x,
                       self.frame.origin.y,
                       self.frame.size.width,
                       zHeight);
    self.frame = frame;
}

- (void)setZSize:(CGSize)zSize {
    CGRect frame = self.frame;
    frame = CGRectMake(self.frame.origin.x,
                       self.frame.origin.y,
                       zSize.width,
                       zSize.height);
    self.frame = frame;
}

- (void)setZOrigin:(CGPoint)zOrigin {
    CGRect frame = self.frame;
    frame = CGRectMake(zOrigin.x,
                       zOrigin.y,
                       self.frame.size.width,
                       self.frame.size.height);
    self.frame = frame;
}

- (void)setZCenterX:(CGFloat)zCenterX {
    CGPoint center = self.center;
    center.x = zCenterX;
    self.center = center;
}

- (void)setZCenterY:(CGFloat)zCenterY {
    CGPoint center = self.center;
    center.y = zCenterY;
    self.center = center;
}

@end










