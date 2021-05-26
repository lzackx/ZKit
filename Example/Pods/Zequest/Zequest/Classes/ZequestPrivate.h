//
//  ZequestPrivate.h
//  Pods
//
//  Created by lzackx on 2021/5/21.
//

#ifndef ZequestPrivate_h
#define ZequestPrivate_h

#import <AFNetworking/AFNetworking.h>
#import <YYCache/YYCache.h>


#define ZEQUEST_CACHE_NAME		@"com.lzackx.zequest.cache"
#define ZEQUEST_CACHE_DIRECTORY_NAME		@"ZequestCache"

@interface Zequest ()

@property (nonatomic, readwrite, strong) AFNetworkReachabilityManager *commonReachabilityManager;
@property (nonatomic, readwrite, strong) AFHTTPSessionManager *commonHTTPSessionManager;

@property (nonatomic, readwrite, copy) NSDictionary *commonHeaderParameters;
@property (nonatomic, readwrite, copy) NSDictionary *commonBodyParameters;
@property (nonatomic, readwrite, assign) NSTimeInterval commonRequestTimeoutInterval;
@property (nonatomic, readwrite, copy) NSIndexSet *commonAcceptableStatusCodes;
@property (nonatomic, readwrite, assign) NSInteger maxConcurrentOperationCount;
@property (nonatomic, readwrite, copy) void(^commonRequestTaskDidFinishCollectingMetrics)(NSURLSession *session, NSURLSessionTask *task, NSURLSessionTaskMetrics * metrics);
@property (nonatomic, readwrite, copy) void(^commonRequestTaskDidComplete)(NSURLSession *session, NSURLSessionTask *task, NSError *error);

//@property (nonatomic, readwrite, strong) NSCache<NSString *, NSString *> *commonCache;
@property (nonatomic, readwrite, strong) YYCache *commonCache;
@property (nonatomic, readwrite, strong) NSOperationQueue *cacheQueue;

@end

#endif /* ZequestPrivate_h */
