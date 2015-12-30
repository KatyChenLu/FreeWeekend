//
//  HeadScrollView.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadScrollView : UIScrollView

@property (nonatomic, strong) UIView *naviView;

+ (instancetype)headScrollViewWithImages:(NSArray *)imageArray;

- (void)headViewDidScroll:(CGRect)rect headViewHeight:(CGFloat)height;

@end
