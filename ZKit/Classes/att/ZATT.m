//
//  ZATT.m
//  ZKit
//
//  Created by lzackx
//

#import "ZATT.h"
#import <ZKit/ZKit.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation ZATT

- (void)requestATTAuthorization {
	if (@available(iOS 14, *)) {
		ZLog(@"[ZKit]: Request Tracking Authorization");
		[ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
			switch (status) {
				case 0: // Not Determined
					ZLog(@"[ZKit]: Request Tracking Authorization => Not Determined");
					break;
				case 1: // Restricted
					ZLog(@"[ZKit]: Request Tracking Authorization => Restricted");
					break;
				case 2: // Denied
					ZLog(@"[ZKit]: Request Tracking Authorization => Denied");
					break;
				case 3: // Authorized
				default:
					ZLog(@"[ZKit]: Request Tracking Authorization => Authorized");
					break;
			}
		}];
	} else {
		// Fallback on earlier versions
	}
}

@end
