//
//  ZRouterManager.h
//  ZKit
//
//  Created by lzackx
//

#import <Foundation/Foundation.h>
#import <Zouter/Zouter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRouterManager : NSObject

+ (void)initializeWithScheme:(NSString *)scheme;
+ (void)registerDefaultRouters;

// Registration
// targetActionURL: scheme://[target]/[action]?[params]
+ (void)registerWithPattern:(NSString *)pattern
			targetActionURL:(NSString *)targetActionURL
			   synchronizly:(BOOL)synchronizly
				   priority:(ZouterCommandPriority)priority
				 willExcute:(ZouterCommandCallback __nullable)willExcute
				  didExcute:(ZouterCommandCallback __nullable)didExcute
				 parameters:(NSDictionary<NSString *, NSObject *> * __nullable)parameters;

+ (void)registerCommand:(ZouterCommand *)command;

// Perform
+ (void)performURLString:(NSString * _Nullable)urlString;
+ (void)performURL:(NSURL * _Nullable)url;

@end

NS_ASSUME_NONNULL_END
