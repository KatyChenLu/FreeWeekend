//
//  DetailView.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

typedef enum : NSUInteger {
    AppDetailButtonShare,
    AppDetailButtonFavourite,
    AppDetailButtonHelp,
} AppDetailButtonType;

@class DetailView;
@protocol DetailButtonClickDelegate <NSObject>
- (void)buttonClick:(DetailView *)detailView clickButonType:(AppDetailButtonType)clickButonType;
@end

@interface DetailView : UIView
@property (nonatomic, weak) id<DetailButtonClickDelegate> delegate;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIView *naviView;

@property (nonatomic, strong)DetailModel *model;

@property (nonatomic, assign, readonly) CGFloat viewHeight;

@property (nonatomic, assign)NSInteger mageConunt;

@end
