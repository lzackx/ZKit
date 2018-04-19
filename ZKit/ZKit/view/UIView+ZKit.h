//
//  UIView+ZKit.h
//  ZKit
//
//  Created by lzackx on 2018/4/18.
//  Copyright © 2018年 lzackx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (ZKit)

// MARK: - getter
- (CGFloat)zX;
- (CGFloat)zY;
- (CGFloat)zCenterX;
- (CGFloat)zCenterY;
- (CGFloat)zWidth;
- (CGFloat)zHeight;
- (CGSize)zSize;
- (CGPoint)zOrigin;

// MARK: - setter
- (void)setZX:(CGFloat)zX;
- (void)setZY:(CGFloat)zY;
- (void)setZWidth:(CGFloat)zWidth;
- (void)setZHeight:(CGFloat)zHeight;
- (void)setZSize:(CGSize)zSize;
- (void)setZOrigin:(CGPoint)zOrigin;
- (void)setZCenterX:(CGFloat)zCenterX;
- (void)setZCenterY:(CGFloat)zCenterY;

@end
