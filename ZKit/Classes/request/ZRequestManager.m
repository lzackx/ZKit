//
//  ZRequestManager.m
//  ZKit
//
//  Created by lzackx
//

#import "ZRequestManager.h"
#import <Zequest/Zequest.h>

@implementation ZRequestManager

+ (void)launchRequestWithRequestMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
									 commonHeaderParameters:(nullable NSDictionary *)commonHeaderParameters
									   commonBodyParameters:(nullable NSDictionary *)commonBodyParameters
									 requestTimeoutInterval:(NSTimeInterval)requestTimeoutInterval
							  responseAcceptableStatusCodes:(nullable NSIndexSet *)acceptableStatusCodes
		   commonRequestTaskDidFinishCollectingMetricsBlock:(nullable void(^)(NSURLSession *session, NSURLSessionTask *task, NSURLSessionTaskMetrics * metrics))requestTaskDidFinishCollectingMetricsBlock
						  commonRequestTaskDidCompleteBlock:(nullable void (^)(NSURLSession *session, NSURLSessionTask *task, NSError * _Nullable error))requestTaskDidCompleteBlock {
	[[Zequest shared] registerCommonRequestMaxConcurrentOperationCount:maxConcurrentOperationCount];
	[[Zequest shared] registerCommonHeaderParameters:commonBodyParameters];
	[[Zequest shared] registerCommonBodyParameters:commonBodyParameters];
	[[Zequest shared] registerCommonRequestTimeoutInterval:requestTimeoutInterval];
	[[Zequest shared] registerCommonResponseAcceptableStatusCodes:acceptableStatusCodes];
	[[Zequest shared] registerCommonRequestTaskDidFinishCollectingMetricsBlock:requestTaskDidFinishCollectingMetricsBlock];
	[[Zequest shared] registerCommonRequestTaskDidCompleteBlock:requestTaskDidCompleteBlock];
	[[Zequest shared] launchCommonHTTPSessionManager];
}

+ (void)launchNetworkReachabilityMonitorWithDomain:(nullable NSString *)domain
							  statusChangeCallback:(nullable void (^)(NSInteger status))statusChangeCallback {
	[[Zequest shared] launchReachabilityManagerWithDomain:domain statusChangeCallback:statusChangeCallback];
}

+ (void)get:(NSString *)url
	 header:(NSDictionary *)header
 parameters:(NSDictionary *)parameters
shouldCache:(BOOL)shouldCache
  dataClass:(nullable Class)dataClass
	success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
	failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
	[[Zequest shared] get:url
				   header:header
			   parameters:parameters
			  shouldCache:shouldCache
				dataClass:dataClass
				 progress:nil
				  success:success
				  failure:failure];
}

+ (void)post:(NSString *)url
	  header:(NSDictionary *)header
  parameters:(NSDictionary *)parameters
 shouldCache:(BOOL)shouldCache
   dataClass:(nullable Class)dataClass
	 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
	 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
	[[Zequest shared] post:url
					header:header
				parameters:parameters
			   shouldCache:shouldCache
				 dataClass:dataClass
				  progress:nil
				   success:success
				   failure:failure];
}

+ (void)cachedResponseForURL:(NSString *)url
				   dataClass:(nullable Class)dataClass
					 success:(nullable void (^)(NSString * _Nullable jsonObject))success
					 failure:(nullable void (^)(NSError * _Nonnull error))failure {
	[[Zequest shared] cachedResponseForURL:url
								 dataClass:dataClass
								   success:success
								   failure:failure];
}

@end
