//
//  LoginView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "LoginView.h"
#import <UIImageView+WebCache.h>
#import "UIView+Common.h"
@implementation LoginView {
    CGRect _superViewBouns;
    UIButton *_maxCoverButton;
    __weak IBOutlet UIImageView *userImageView;
    UIView *_HeHeView;
}

- (void)awakeFromNib
{
    //?
//    self.backgroundColor = [UIColor whiteColor];
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = userImageView.bounds.size.height / 2;
    
    _maxCoverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _maxCoverButton.frame = [UIScreen mainScreen].bounds;
    [_maxCoverButton setBackgroundColor:[UIColor blackColor]];
    [_maxCoverButton setAlpha:0.3];
    [_maxCoverButton addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

+(instancetype)LoginView {
    LoginView *loginView = [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil].lastObject;
    
    return loginView;
}
- (IBAction)touchSine:(UIButton *)sender {
   
    [self showPromptViewToView];
}
- (IBAction)touchWeiXin:(UIButton *)sender {
    [self showPromptViewToView];
}

- (void)showPromptViewToView {
     _HeHeView = [UIView new];
    _HeHeView.frame = CGRectMake(0, 0, 260, 150);//260*120
    _HeHeView.center = CGPointMake(AppWidth/2, -600);
    _HeHeView.backgroundColor = [UIColor clearColor];
    
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSArray *gifArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"11"],
                         [UIImage imageNamed:@"12"],
                         [UIImage imageNamed:@"13"],
                         [UIImage imageNamed:@"14"],nil];
    gifImageView.animationImages = gifArray; //动画图片数组
    gifImageView.backgroundColor = [UIColor clearColor];
    gifImageView.animationDuration = 0.3; //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 0;  //动画重复次数
    [gifImageView startAnimating];
    gifImageView.frame = CGRectMake(0, 0, 260, 120);
    gifImageView.center = CGPointMake(130, 60);
    
    [_HeHeView addSubview:gifImageView];
    UILabel *hehe = [UILabel new];
    hehe.text = @"Yoooooooooo~ just for fun";
    hehe.numberOfLines = 0;
    hehe.font = [UIFont systemFontOfSize:10 weight:15];
    hehe.textAlignment =  NSTextAlignmentCenter;
    hehe.frame = CGRectMake(0, 0, 260, 30);
    hehe.center = CGPointMake(130, 15);
    [_HeHeView addSubview:hehe];
    
    [UIView animateWithDuration:4 animations:^{
        _HeHeView.center = CGPointMake(AppWidth/2, AppHeight/2);
//        _HeHeView.transform = CGAffineTransformMakeScale(2.0, 2.0);
//        _HeHeView.alpha = 0.0;
    }];
    
    
    
    [self addSubview:_HeHeView];

}

- (void)showLoginViewToView:(UIView *)view {
    [view addSubview:_maxCoverButton];//?
    _superViewBouns = view.bounds;
    self.frame = CGRectMake(0, height(view), width(view),250);
    [view addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, height(view)-250, width(view), 250);
    }];
}
- (void)coverClick
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, _superViewBouns.size.height, _superViewBouns.size.width, 250);
    } completion:^(BOOL finished) {
        [_maxCoverButton removeFromSuperview];
        [self removeFromSuperview];
        [_HeHeView removeFromSuperview];
    }];
}

@end
