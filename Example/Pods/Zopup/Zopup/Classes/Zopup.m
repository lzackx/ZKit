//
//  Zopup.m
//  Zopup
//
//  Created by lzackx on 2021/5/26.
//

#import "Zopup.h"
#import "ZopupPrivate.h"

@implementation Zopup

// MARK: - Life Cycle
static Zopup *_shared = nil;

+ (instancetype)shared {
	if (_shared == nil) {
		_shared = [[Zopup alloc] init];
	}
	return _shared;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
	if (_shared == nil) {
		_shared = [[super allocWithZone:zone] init];
	}
	return _shared;
}

- (id)copyWithZone:(nullable NSZone *)zone {
	return self;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
	return self;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		_popupOperations = [NSMutableArray array];
		_popupQueue = [[NSOperationQueue alloc] init];
		_popupQueue.name = ZOPUP_QUEUQ_NAME;
		_popupQueue.maxConcurrentOperationCount = 1;
		_popupVC = [[ZopupViewController alloc] init];
		_popupWindow = [[UIWindow alloc] init];
		_popupWindow.rootViewController = _popupVC;
		_popupWindow.backgroundColor = [UIColor clearColor];
		_popupWindow.windowLevel = UIWindowLevelAlert;
		[_popupWindow resignKeyWindow];
		[_popupWindow setHidden:YES];
		_operationsLock = [[NSLock alloc] init];
	}
	return self;
}

// MARK: - Schedule Methods
- (void)clearPopup {
	// Presentation
	if (self.popupVC.presentedViewController) {
		[self.popupVC.presentedViewController dismissViewControllerAnimated:NO completion:^{
					
		}];
	}
	// Push
	for (UIViewController *svc in self.popupVC.childViewControllers) {
		[svc removeFromParentViewController];
	}
	// Subviews
	for (UIView *sv in self.popupVC.view.subviews) {
		[sv removeFromSuperview];
	}
}

- (void)popup {
	[self.popupWindow makeKeyAndVisible];
}

- (void)hide {
	[self.popupWindow resignKeyWindow];
	[self.popupWindow setHidden:YES];
}

// MARK: - Public Methods
- (void)setupPopupBackgroundColor:(UIColor *)popupBackgroundColor {
	self.popupWindow.backgroundColor = popupBackgroundColor;
}

- (void)addPopupWithView:(UIView *)view {
	__weak typeof(self) wSelf = self;
	NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			[wSelf.popupVC.view addSubview:view];
		});
	}];
	[self.operationsLock lock];
	[self.popupOperations addObject:operation];
	[self.operationsLock unlock];
}

- (void)addPopupWithViewController:(UIViewController *)viewController {
	__weak typeof(self) wSelf = self;
	NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
			[wSelf.popupVC presentViewController:viewController animated:NO completion:^{
				
			}];
		});
	}];
	[self.operationsLock lock];
	[self.popupOperations addObject:operation];
	[self.operationsLock unlock];
}

- (void)schedule {
	[self clearPopup];
	if (self.popupOperations.count > 0) {
		NSOperation *operation = self.popupOperations.firstObject;
		[self.operationsLock lock];
		[self.popupOperations removeObject:operation];
		[self.operationsLock unlock];
		[self.popupQueue addOperation:operation];
		[self popup];
	} else {
		[self hide];
	}
}

- (void)clearOperations {
	[self.operationsLock lock];
	[self.popupOperations removeAllObjects];
	[self.operationsLock unlock];
}

- (void)popupIndividuallyWithView:(UIView *)view {
	__weak typeof(self) wSelf = self;
	NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			[wSelf.popupVC.view addSubview:view];
		});
	}];
	[self.popupQueue addOperation:operation];
	[self popup];
}

- (void)popupIndividuallyWithViewController:(UIViewController *)viewController {
	__weak typeof(self) wSelf = self;
	NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
			[wSelf.popupVC presentViewController:viewController animated:NO completion:^{
				
			}];
		});
	}];
	[self.popupQueue addOperation:operation];
	[self popup];
}

- (void)hideIndividuallyPopup {
	[self clearPopup];
	[self hide];
}

@end
