//
//  SelectView.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectView;

@protocol SelectViewDelegate <NSObject>

@optional

- (void)selecteView:(SelectView *)selectView didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
- (void)selecteView:(SelectView *)selectView didChangeSelectedView:(NSInteger)to;


@end


@interface SelectView : UIView

@property (nonatomic, weak) id<SelectViewDelegate>delegate;
//外部接口
- (void)linkToIndex:(NSInteger)index;
@end
