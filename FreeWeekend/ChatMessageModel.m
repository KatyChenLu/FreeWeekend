//
//  ChatMessageModel.m
//  WFQQChatDemo
//
//  Created by JackWong on 15/12/18.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import "ChatMessageModel.h"

@implementation ChatMessageModel

+ (instancetype)messageWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
