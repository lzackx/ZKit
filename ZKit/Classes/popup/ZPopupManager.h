//
//  ZPopupManager.h
//  ZKit
//
//  Created by lzackx
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPopupManager : NSObject

// MARK: - Popup Schedully
+ (void)registerPopupObjects:(NSArray *)popupObjects;
+ (void)schedulePopupObjects;

// MARK: - Popup Individually
+ (void)popupIndividuallyWithObject:(NSObject *)object;
+ (void)hideIndividuallyPopupObject;

@end

NS_ASSUME_NONNULL_END
