//
//  Zequest.m
//  Zequest
//
//  Created by lzackx on 2021/5/19.
//

#import "Zequest.h"
#import "ZequestPrivate.h"
#import "Zequest+Cache.h"
#import <YYModel/YYModel.h>

@implementation Zequest

// MARK: - Life Cycle
static Zequest *_shared = nil;

+ (instancetype)shared {
	if (_shared == nil) {
		_shared = [[Zequest alloc] init];
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
		_commonHeaderParameters = [NSDictionary dictionary];
		_commonBodyParameters = [NSDictionary dictionary];
		_commonRequestTimeoutInterval = 8.0;
		_commonAcceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 100)];
		_commonRequestTaskDidComplete = nil;
		_commonCache = [YYCache cacheWithPath:[Zequest pathForCachesDirectory]];
		_commonCache.diskCache.customArchiveBlock = ^NSData * _Nonnull(NSString * _Nonnull object) {
			NSData *data = [object dataUsingEncoding:NSUTF8StringEncoding];
			return data;
		};
		_commonCache.diskCache.customUnarchiveBlock = ^NSString * _Nonnull(NSData * _Nonnull data) {
			NSString *d = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
			return d;
		};
		_cacheQueue = [[NSOperationQueue alloc] init];
		_cacheQueue.maxConcurrentOperationCount = 1;
		_cacheQueue.name = ZEQUEST_CACHE_NAME;
	}
	return self;
}

// MARK: - Parameters
- (AFHTTPRequestSerializer *)defaultCommonRequestSerializer {
	AFHTTPRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
	serializer.timeoutInterval = self.commonRequestTimeoutInterval;
	return serializer;
}

- (AFHTTPResponseSerializer *)defaultCommonResponseSerializer {
	AFHTTPResponseSerializer *serializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingFragmentsAllowed];
	serializer.acceptableStatusCodes = self.commonAcceptableStatusCodes;
	serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
	return serializer;
}

- (void)registerCommonRequestMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount {
	if (maxConcurrentOperationCount <= 0) {
		return;
	}
	self.maxConcurrentOperationCount = maxConcurrentOperationCount;
}

- (void)registerCommonHeaderParameters:(NSDictionary *)commonHeaderParameters {
	if (commonHeaderParameters == nil) {
		return;
	}
	self.commonHeaderParameters = commonHeaderParameters;
}

- (void)registerCommonBodyParameters:(NSDictionary *)commonBodyParameters {
	if (commonBodyParameters == nil) {
		return;
	}
	self.commonBodyParameters = commonBodyParameters;
}

- (void)registerCommonRequestTimeoutInterval:(NSTimeInterval)requestTimeoutInterval {
	if (requestTimeoutInterval <= 0) {
		return;
	}
	self.commonRequestTimeoutInterval = requestTimeoutInterval;
}

- (void)registerCommonResponseAcceptableStatusCodes:(NSIndexSet *)acceptableStatusCodes {
	if (acceptableStatusCodes == nil) {
		return;
	}
	self.commonAcceptableStatusCodes = acceptableStatusCodes;
}

- (void)registerCommonRequestTaskDidFinishCollectingMetricsBlock:(void(^)(NSURLSession *session, NSURLSessionTask *task, NSURLSessionTaskMetrics * metrics))requestTaskDidFinishCollectingMetricsBlock {
	if (requestTaskDidFinishCollectingMetricsBlock == nil) {
		return;
	}
	self.commonRequestTaskDidFinishCollectingMetrics = requestTaskDidFinishCollectingMetricsBlock;
}

- (void)registerCommonRequestTaskDidCompleteBlock:(void (^)(NSURLSession *session, NSURLSessionTask *task, NSError *error))requestTaskDidCompleteBlock {
	if (requestTaskDidCompleteBlock == nil) {
		return;
	}
	self.commonRequestTaskDidComplete = requestTaskDidCompleteBlock;
}

// MARK: - Initialize managers
- (void)launchCommonHTTPSessionManager {
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	configuration.HTTPAdditionalHeaders = self.commonHeaderParameters;
	configuration.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways;
	configuration.HTTPShouldSetCookies = YES;
	configuration.URLCache = nil;
	self.commonHTTPSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
	self.commonHTTPSessionManager.requestSerializer = [self defaultCommonRequestSerializer];
	self.commonHTTPSessionManager.requestSerializer.timeoutInterval = self.commonRequestTimeoutInterval;
	self.commonHTTPSessionManager.responseSerializer = [self defaultCommonResponseSerializer];
	self.commonHTTPSessionManager.responseSerializer.acceptableStatusCodes = self.commonAcceptableStatusCodes;
	self.commonHTTPSessionManager.operationQueue.maxConcurrentOperationCount = self.maxConcurrentOperationCount;
	[self.commonHTTPSessionManager setTaskDidFinishCollectingMetricsBlock:self.commonRequestTaskDidFinishCollectingMetrics];
	[self.commonHTTPSessionManager setTaskDidCompleteBlock:self.commonRequestTaskDidComplete];
}

// MARK: - Reachability
- (void)launchReachabilityManagerWithDomain:(nullable NSString *)domain
					   statusChangeCallback:(nullable void (^)(NSInteger status))statusChangeCallback {
	if (self.commonReachabilityManager != nil) {
		[self.commonReachabilityManager stopMonitoring];
		[self.commonReachabilityManager setReachabilityStatusChangeBlock:nil];
	}
	if (domain.length > 0) {
		self.commonReachabilityManager = [AFNetworkReachabilityManager managerForDomain:domain];
	} else {
		self.commonReachabilityManager = [AFNetworkReachabilityManager sharedManager];
	}
	[self.commonReachabilityManager startMonitoring];
	[self.commonReachabilityManager setReachabilityStatusChangeBlock:statusChangeCallback];
}

// MARK: - Request API
- (void)get:(NSString *)url
	 header:(NSDictionary *)header
 parameters:(NSDictionary *)parameters
shouldCache:(BOOL)shouldCache
  dataClass:(nullable Class)dataClass
   progress:(nullable void (^)(NSProgress * _Nonnull))progress
	success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable jsonObject))success
	failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure  {
	// Header
	NSMutableDictionary *h = [NSMutableDictionary dictionaryWithDictionary:self.commonHeaderParameters];
	[h addEntriesFromDictionary:header];
	// Parameters
	NSMutableDictionary *p = [NSMutableDictionary dictionaryWithDictionary:self.commonBodyParameters];
	[p addEntriesFromDictionary:parameters];
	// Success
	__weak typeof(self) wSelf = self;
	void (^successCallback)(NSURLSessionDataTask * _Nonnull, id _Nullable) = ^(NSURLSessionDataTask *task, id jsonObject) {
		if (success == nil) {
			return;
		}
		if (shouldCache) {
			NSString *jsonString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:nil] encoding:NSUTF8StringEncoding];
			[wSelf cacheURL:task.currentRequest.URL.absoluteString cachedResponse:jsonString];
		}
		if (dataClass != nil) {
			id dataModel = [dataClass yy_modelWithJSON:jsonObject];
			if (dataModel != nil) {
				success(task, dataModel);
				return;
			}
		}
		success(task, jsonObject);
	};
	// Failure
	void (^failureCallback)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull) = ^(NSURLSessionDataTask *task, NSError *error) {
		if (failure) {
			failure(task, error);
		}
	};
	[self.commonHTTPSessionManager GET:url
							parameters:p
							   headers:h
							  progress:progress
							   success:successCallback
							   failure:failureCallback];
}

- (void)post:(NSString *)url
	  header:(NSDictionary *)header
  parameters:(NSDictionary *)parameters
 shouldCache:(BOOL)shouldCache
   dataClass:(nullable Class)dataClass
	progress:(nullable void (^)(NSProgress * _Nonnull))progress
	 success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable jsonObject))success
	 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
	// Header
	NSMutableDictionary *h = [NSMutableDictionary dictionaryWithDictionary:self.commonHeaderParameters];
	[h addEntriesFromDictionary:header];
	// Parameters
	NSMutableDictionary *p = [NSMutableDictionary dictionaryWithDictionary:self.commonBodyParameters];
	[p addEntriesFromDictionary:parameters];
	// Success
	__weak typeof(self) wSelf = self;
	void (^successCallback)(NSURLSessionDataTask * _Nonnull, id _Nullable) = ^(NSURLSessionDataTask *task, id jsonObject) {
		if (success == nil) {
			return;
		}
		if (shouldCache) {
			NSString *jsonString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:nil] encoding:NSUTF8StringEncoding];
			[wSelf cacheURL:task.currentRequest.URL.absoluteString cachedResponse:jsonString];
		}
		if (dataClass != nil) {
			id dataModel = [dataClass yy_modelWithJSON:jsonObject];
			if (dataModel != nil) {
				success(task, dataModel);
				return;
			}
		}
		success(task, jsonObject);
	};
	// Failure
	void (^failureCallback)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull) = ^(NSURLSessionDataTask *task, NSError *error) {
		if (failure) {
			failure(task, error);
		}
	};
	[self.commonHTTPSessionManager POST:url
							 parameters:p
								headers:h
							   progress:progress
								success:successCallback
								failure:failureCallback];
}

- (void)cachedResponseForURL:(NSString *)url
				   dataClass:(nullable Class)dataClass
					 success:(nullable void (^)(NSString * _Nullable jsonObject))success
					 failure:(nullable void (^)(NSError * _Nonnull error))failure {
	NSString *cachedResponse = [self getCachedResponseWithURL:url];
	if (cachedResponse.length > 0) {
		if (success) {
			if (dataClass != nil) {
				id dataModel = [dataClass yy_modelWithJSON:cachedResponse];
				if (dataModel != nil) {
					success(dataModel);
					return;
				}
			} else {
				success(cachedResponse);
			}
		}
	} else {
		if (failure) {
			NSError *error = [NSError errorWithDomain:@"NSURLErrorBadURL" code:NSURLErrorBadURL userInfo:nil];
			failure(error);
		}
	}
}

@end
