//
//  SelectButton.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "SelectButton.h"

@implementation SelectButton
- (void)setHighlighted:(BOOL)highlighted {
    //重写这个方法使其不高亮
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        self.imageView.contentMode = UIViewContentModeCenter;
        
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    //按钮图像边界
    return CGRectMake(contentRect
                      .origin.x+2, contentRect.origin.y+2, contentRect.size.width-4, contentRect.size.height-4);
}

@end
