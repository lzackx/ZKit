//
//  Zequest+Cache.m
//  Zequest
//
//  Created by lzackx on 2021/5/19.
//

#import "Zequest+Cache.h"
#import <CommonCrypto/CommonDigest.h>
#import "ZequestPrivate.h"

@implementation Zequest (Cache)

// MARK: - Set Cache
- (void)cacheURL:(NSString *)url cachedResponse:(NSString *)cachedResponse {
	if (url == nil || cachedResponse == nil) {
		return;
	}
	NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
	urlComponents.query = nil;
	
	NSString *key = [Zequest md5ForString:urlComponents.URL.absoluteString];
	[self.commonCache setObject:cachedResponse forKey:key];
}

// MARK: - Get Cache
- (NSString *)getCachedResponseWithURL:(NSString *)url {
	if (url == nil) {
		return nil;
	}
	NSString *key = [Zequest md5ForString:url];
	NSString *cachedResponse = (NSString *)[self.commonCache objectForKey:key];
	return cachedResponse;
}

// MARK: - Private Class Methods
+ (NSString *)md5ForString:(NSString *)string {
   const char *cStr = [string UTF8String];
   unsigned char digest[CC_MD5_DIGEST_LENGTH];
   CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
   NSMutableString *md5String = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
   for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
	   [md5String appendFormat:@"%02x", digest[i]];

   return md5String;
}

+ (NSString *)pathForCachesDirectory {
	NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
	path = [path stringByAppendingPathComponent:ZEQUEST_CACHE_DIRECTORY_NAME];
	if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
		[[NSFileManager defaultManager] createDirectoryAtPath:path
								  withIntermediateDirectories:YES
												   attributes:nil
														error:nil];
	}
	return path;
}

@end
