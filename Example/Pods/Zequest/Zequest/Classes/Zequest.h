//
//  Zequest.h
//  Zequest
//
//  Created by lzackx on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Zequest : NSObject <NSCopying, NSMutableCopying>

+ (instancetype)shared;

// MARK: - Parameters
- (void)registerCommonRequestMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount;
- (void)registerCommonHeaderParameters:(NSDictionary *)commonHeaderParameters;
- (void)registerCommonBodyParameters:(NSDictionary *)commonBodyParameters;
- (void)registerCommonRequestTimeoutInterval:(NSTimeInterval)requestTimeoutInterval;
- (void)registerCommonResponseAcceptableStatusCodes:(NSIndexSet *)acceptableStatusCodes;
- (void)registerCommonRequestTaskDidFinishCollectingMetricsBlock:(nullable void(^)(NSURLSession *session, NSURLSessionTask *task, NSURLSessionTaskMetrics * metrics))requestTaskDidFinishCollectingMetricsBlock;
- (void)registerCommonRequestTaskDidCompleteBlock:(nullable void (^)(NSURLSession *session, NSURLSessionTask *task, NSError * _Nullable error))requestTaskDidCompleteBlock;

// MARK: - Customized Common Manager
- (void)launchCommonHTTPSessionManager;
- (void)launchReachabilityManagerWithDomain:(nullable NSString *)domain
					   statusChangeCallback:(nullable void (^)(NSInteger status))statusChangeCallback;

// MARK: - Request API
- (void)get:(NSString *)url
	 header:(NSDictionary *)header
 parameters:(NSDictionary *)parameters
shouldCache:(BOOL)shouldCache
  dataClass:(nullable Class)dataClass
   progress:(nullable void (^)(NSProgress * _Nonnull))downloadProgress
	success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable jsonObject))success
	failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

- (void)post:(NSString *)url
	  header:(NSDictionary *)header
  parameters:(NSDictionary *)parameters
 shouldCache:(BOOL)shouldCache
   dataClass:(nullable Class)dataClass
	progress:(nullable void (^)(NSProgress * _Nonnull))progress
	 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable jsonObject))success
	 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

// MARK: - Cache
- (void)cachedResponseForURL:(NSString *)url
				   dataClass:(nullable Class)dataClass
					 success:(nullable void (^)(NSString * _Nullable jsonObject))success
					 failure:(nullable void (^)(NSError * _Nonnull error))failure;

@end

NS_ASSUME_NONNULL_END
