//
//  Zopup.h
//  Zopup
//
//  Created by lzackx on 2021/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Zopup : NSObject

+ (instancetype)shared;

// MARK: - Popup continuously
- (void)setupPopupBackgroundColor:(UIColor *)popupBackgroundColor;
- (void)addPopupWithView:(UIView *)view;
- (void)addPopupWithViewController:(UIViewController *)viewController;
- (void)schedule;
- (void)clearOperations;

// MARK: - Popup Individually
- (void)popupIndividuallyWithView:(UIView *)view;
- (void)popupIndividuallyWithViewController:(UIViewController *)viewController;
- (void)hideIndividuallyPopup;

@end

NS_ASSUME_NONNULL_END
