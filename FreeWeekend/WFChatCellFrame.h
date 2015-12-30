//
//  WFChatCellFrame.h
//  WFQQChatDemo
//
//  Created by JackWong on 15/12/18.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ChatMessageModel.h"

#define WFTEXYFONT [UIFont systemFontOfSize:12] 

@interface WFChatCellFrame : NSObject
/**
 *  聊天时间的 Frame
 */
@property (nonatomic, assign) CGRect chatTimeFrame;
/**
 *  聊天头像 Frame
 */
@property (nonatomic, assign) CGRect iconImageFrame;

/**
 *  聊天内容 Frame
 */
@property (nonatomic, assign) CGRect chatTextFrame;
/**
 *  cell的高度
 */
@property (nonatomic, assign) CGFloat chatCellHeight;

/**
 *  聊天模型 Model
 */
@property (nonatomic, strong) ChatMessageModel *messageModel;



@end
