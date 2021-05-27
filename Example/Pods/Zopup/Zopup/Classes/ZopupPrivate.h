//
//  ZopupPrivate.h
//  Pods
//
//  Created by lzackx on 2021/5/26.
//

#ifndef ZopupPrivate_h
#define ZopupPrivate_h

#import "ZopupViewController.h"


#define ZOPUP_QUEUQ_NAME		@"com.lzackx.zopup.queue"

@interface Zopup ()

@property (nonatomic, readwrite, strong) NSMutableArray *popupOperations;
@property (nonatomic, readwrite, strong) NSOperationQueue *popupQueue;
@property (nonatomic, readwrite, strong) ZopupViewController *popupVC;
@property (nonatomic, readwrite, strong) UIWindow *popupWindow;
@property (nonatomic, readwrite, strong) NSLock *operationsLock;

@end

#endif /* ZopupPrivate_h */
