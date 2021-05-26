//
//  ZATT.h
//  ZKit
//
//  Created by lzackx
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZATT : NSObject

/// Request App Tracking Authorization
///
///  - Info.plist should add description as follow:
///
///  <key>NSUserTrackingUsageDescription</key>
///
///  <string>??想要获取您设备的广告标识符，以为您提供更好的广告体验</string>
- (void)requestATTAuthorization;

@end

NS_ASSUME_NONNULL_END
