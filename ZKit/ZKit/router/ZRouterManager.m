//
//  ZRouterManager.m
//  ZKit
//
//  Created by lzackx
//

#import "ZRouterManager.h"
#import <Zouter/Zouter.h>

@implementation ZRouterManager

+ (void)initializeWithScheme:(NSString *)scheme {
	[Zouter initializeWithScheme:scheme];
}

+ (void)registerDefaultRouters {
	[Zouter sharedRouter];
}

// Registration
// targetActionURL: scheme://[target]/[action]?[params]

+ (void)registerWithPattern:(NSString *)pattern
			targetActionURL:(NSString *)targetActionURL
			   synchronizly:(BOOL)synchronizly
				   priority:(ZouterCommandPriority)priority
				 willExcute:(ZouterCommandCallback)willExcute
				  didExcute:(ZouterCommandCallback)didExcute
				 parameters:(NSDictionary<NSString *, NSObject *> *)parameters {
	
	ZouterCommand *command = [ZouterCommand new];
	command.pattern = pattern;
	command.taURL = targetActionURL;
	command.synchronizly = synchronizly;
	command.priority = priority;
	command.willExcute = willExcute;
	command.didExcute = didExcute;
	command.parameters = parameters;
	[ZRouterManager registerCommand:command];
}

+ (void)registerCommand:(ZouterCommand *)command {
	[[Zouter sharedRouter] registerCommand:command];
}

// Perform
+ (void)performURLString:(NSString * _Nullable)urlString {
	[[Zouter sharedRouter] performURLString:urlString];
}

+ (void)performURL:(NSURL * _Nullable)url {
	[[Zouter sharedRouter] performURL:url];
}

@end
