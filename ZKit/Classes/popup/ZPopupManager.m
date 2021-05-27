//
//  ZPopupManager.m
//  ZKit
//
//  Created by lzackx
//

#import "ZPopupManager.h"
#import <Zopup/Zopup.h>


@implementation ZPopupManager

+ (void)registerPopupObjects:(NSArray *)popupObjects {
	for (NSObject *o in popupObjects) {
		if ([o isKindOfClass:[UIView class]]) {
			[[Zopup shared] addPopupWithView:(UIView *)o];
		} else if ([o isKindOfClass:[UIViewController class]]) {
			[[Zopup shared] addPopupWithViewController:(UIViewController *)o];
		}
	}
}

+ (void)schedulePopupObjects {
	[[Zopup shared] schedule];
}

+ (void)popupIndividuallyWithObject:(NSObject *)object {
	if ([object isKindOfClass:[UIView class]]) {
		[[Zopup shared] popupIndividuallyWithView:(UIView *)object];
	} else if ([object isKindOfClass:[UIViewController class]]) {
		[[Zopup shared] popupIndividuallyWithViewController:(UIViewController *)object];
	}
}

+ (void)hideIndividuallyPopupObject {
	[[Zopup shared] hideIndividuallyPopup];
}

@end
