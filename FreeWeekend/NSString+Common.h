//
//  NSString+Common.h
//  iFree_iOS
//
//  Created by JackWong on 15/12/10.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Common)
NSString * URLEncodedString(NSString *str);
NSString * MD5Hash(NSString *aString);

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
