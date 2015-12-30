//
//  ChatMessageModel.h
//  WFQQChatDemo
//
//  Created by JackWong on 15/12/18.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ChatMessageTypeMe,// 自己
    ChatMessageTypeOther,//别人
} ChatMessageType;

@interface ChatMessageModel : NSObject

/**
 *  聊天内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *   聊天时间
 */
@property (nonatomic, copy) NSString *time;

/**
 *  是否显示时间 YES 显示 NO 的话不显示
 */
@property (nonatomic, assign) BOOL isShowTime;
/**
 *  聊天对象(自己和别人)
 */
//@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) ChatMessageType type;

+ (instancetype)messageWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
