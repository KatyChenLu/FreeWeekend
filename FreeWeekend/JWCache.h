//
//  JWCache.h
//  JWCache
//
//  Created by JackWong on 6/28/12.
//  Copyright (c) 2012 JackWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JWCache : NSObject
+ (CGFloat)fileSize;
+ (NSString*) cacheDirectory ;

+ (void) resetCache;

+ (void) setObject:(NSData*)data forKey:(NSString*)key;

+ (id) objectForKey:(NSString*)key;

@end
