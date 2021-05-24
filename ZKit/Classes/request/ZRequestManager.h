//
//  ZRequestManager.h
//  ZKit
//
//  Created by lzackx
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRequestManager : NSObject

+ (void)launchRequestWithRequestMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
									 commonHeaderParameters:(nullable NSDictionary *)commonHeaderParameters
									   commonBodyParameters:(nullable NSDictionary *)commonBodyParameters
									 requestTimeoutInterval:(NSTimeInterval)requestTimeoutInterval
							  responseAcceptableStatusCodes:(nullable NSIndexSet *)acceptableStatusCodes
		   commonRequestTaskDidFinishCollectingMetricsBlock:(nullable void(^)(NSURLSession *session, NSURLSessionTask *task, NSURLSessionTaskMetrics * metrics))requestTaskDidFinishCollectingMetricsBlock
						  commonRequestTaskDidCompleteBlock:(nullable void (^)(NSURLSession *session, NSURLSessionTask *task, NSError * _Nullable error))requestTaskDidCompleteBlock;

+ (void)launchNetworkReachabilityMonitorWithDomain:(nullable NSString *)domain
							  statusChangeCallback:(nullable void (^)(NSInteger status))statusChangeCallback;

+ (NSString *)fetchCachedResponseFor:(NSString *)url;

+ (void)get:(NSString *)url
	 header:(NSDictionary *)header
 parameters:(NSDictionary *)parameters
shouldCache:(BOOL)shouldCache
  dataClass:(nullable Class)dataClass
	success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
	failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

+ (void)post:(NSString *)url
	  header:(NSDictionary *)header
  parameters:(NSDictionary *)parameters
 shouldCache:(BOOL)shouldCache
   dataClass:(nullable Class)dataClass
	 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
	 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

@end

NS_ASSUME_NONNULL_END
