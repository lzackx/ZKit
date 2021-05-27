//
//  ZopupViewController.m
//  Zopup
//
//  Created by lzackx on 2021/5/26.
//

#import "ZopupViewController.h"

@interface ZopupViewController ()

@end

@implementation ZopupViewController

// MARK: - Life Cycle

- (instancetype)init {
	self = [super init];
	if (self) {
//		NSLog(@"%s", __FUNCTION__);
	}
	return self;
}

- (void)loadView {
	[super loadView];
//	NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
//	NSLog(@"%s", __FUNCTION__);
	[self.view setUserInteractionEnabled:YES];
	self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
//	NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
//	NSLog(@"%s", __FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
//	NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
//	NSLog(@"%s", __FUNCTION__);
}

@end
