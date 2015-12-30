//
//  GotoPayForView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "GotoPayForView.h"
#import "GotoButton.h"
#import "LoginView.h"
@interface GotoPayForView ()
@property (weak, nonatomic) IBOutlet GotoButton *gotoButton;

@end

@implementation GotoPayForView


- (void)awakeFromNib {
    [self.gotoButton addTarget:self action:@selector(touchesGoToButton) forControlEvents:UIControlEventTouchUpInside];

}

- (instancetype)init {
    GotoPayForView *gotoView = [[NSBundle mainBundle] loadNibNamed:@"GotoPayForView" owner:nil options:nil].lastObject;
    
    return gotoView;
}

- (void)touchesGoToButton {
    [self showLoginView];
}
- (void)showLoginView {
    //初始化
    LoginView *loginView = [LoginView LoginView];
    [loginView showLoginViewToView:self.superview];
}





@end
