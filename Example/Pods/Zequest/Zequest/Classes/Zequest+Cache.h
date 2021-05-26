//
//  Zequest+Cache.h
//  Zequest
//
//  Created by lzackx on 2021/5/19.
//

#import "Zequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface Zequest (Cache)

+ (NSString *)pathForCachesDirectory;

- (void)cacheURL:(NSString *)url cachedResponse:(NSString *)cachedResponse;
- (NSString *)getCachedResponseWithURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
