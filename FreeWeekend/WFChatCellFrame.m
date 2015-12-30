//
//  WFChatCellFrame.m
//  WFQQChatDemo
//
//  Created by JackWong on 15/12/18.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import "WFChatCellFrame.h"
#import "UIView+Common.h"
#import "NSString+Common.h"
#define WFTEXYFONT [UIFont systemFontOfSize:12]
@implementation WFChatCellFrame

- (void)setMessageModel:(ChatMessageModel *)messageModel {
    _messageModel = messageModel;
    if (_messageModel.isShowTime) {
      _chatTimeFrame = CGRectMake(0, 0, screenWidth(), 20);
    }
    CGFloat chatPadding = 10;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconY = CGRectGetMaxY(_chatTimeFrame);
    if (_messageModel.type == ChatMessageTypeOther) {
        _iconImageFrame = CGRectMake(chatPadding, iconY, iconW, iconH);
    }else {
        _iconImageFrame = CGRectMake(screenWidth() - iconW - chatPadding, iconY, iconW, iconH);
    }
    
    CGFloat chatTextW = 150;
    CGFloat chatTextX;
    CGFloat chatTextY = iconY;
    CGSize chatSize = [messageModel.text sizeWithFont:WFTEXYFONT maxSize:CGSizeMake(chatTextW, MAXFLOAT)];
    if (_messageModel.type == ChatMessageTypeOther) {
        chatTextX = CGRectGetMaxX(_iconImageFrame) + chatPadding;
    }else {
        chatTextX = screenWidth() - iconW - chatPadding - chatSize.width - chatPadding - 2*20;
    }
    _chatTextFrame = CGRectMake(chatTextX, chatTextY, chatSize.width+2*20, chatSize.height+2*20);
    /**
     *  cell 的高度要综合考虑情况(要考虑只有一行的情况)
     *
     *  @param _iconImageFrame
     *
     *  @return
     */
    _chatCellHeight = MAX(CGRectGetMaxY(_iconImageFrame) + chatPadding, CGRectGetMaxY(_chatTextFrame)+ chatPadding);
}

@end
