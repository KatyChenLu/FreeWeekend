//
//  LeftViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/20.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "LeftViewController.h"
#import "UIView+Common.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "FoundViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "LoginView.h"
#import "FavourtViewController.h"
#import "SetingViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatLeftView];
   

}
- (void)creatLeftView {
   
    
    self.view.backgroundColor = [UIColor redColor];
    self.view.frame = CGRectMake(0, 0, AppWidth*0.5, AppHeight);
    UIImageView *background = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"leftbackiamge"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.view addSubview:background];
    
    UIImageView *icon = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"Icon-76"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    icon.layer.cornerRadius = 15;
    icon.clipsToBounds = YES;
    icon.frame = CGRectMake((AppWidth-50)/2, AppHeight*0.2, 50, 50);
    [self.view addSubview:icon];
    
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"homeSeletced.png"] forState:UIControlStateSelected];
    [homeBtn addTarget:self action:@selector(touchesHomeBtn) forControlEvents:UIControlEventTouchUpInside];
    homeBtn.frame = CGRectMake(AppWidth*0.2, maxY(icon)+5, AppWidth*0.64, AppWidth*0.18);
    [self.view addSubview:homeBtn];
//
    UIButton *foundBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [foundBtn setBackgroundImage:[UIImage imageNamed:@"found"] forState:UIControlStateNormal];
    [foundBtn setBackgroundImage:[UIImage imageNamed:@"foundSelected"] forState:UIControlStateSelected];
     [foundBtn addTarget:self action:@selector(touchesFoundBtn) forControlEvents:UIControlEventTouchUpInside];
    foundBtn.frame = CGRectMake(AppWidth*0.2, maxY(homeBtn)+5, AppWidth*0.64, AppWidth*0.18);
    [self.view addSubview:foundBtn];
    
    UIImageView *linc = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"blackLine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    linc.frame = CGRectMake(13, maxY(foundBtn)+5, 343, 22);
    [self.view addSubview:linc];
    
//    UIImageView *unlogin = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"unLogin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    unlogin.contentMode = UIViewContentModeScaleAspectFit;
//    unlogin.frame = CGRectMake(57, maxY(foundBtn)+10, 304, 70);
//    [self.view addSubview:unlogin];
    
    UIButton *sinaBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [sinaBtn setBackgroundImage:[UIImage imageNamed:@"loginsina@2x副本"] forState:UIControlStateNormal];
    sinaBtn.frame = CGRectMake(AppWidth*0.2, maxY(foundBtn)+20, AppWidth*0.64, AppWidth*0.18);
    [sinaBtn addTarget:self action:@selector(touchSinaBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sinaBtn];
    
    UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [weixinBtn setBackgroundImage:[UIImage imageNamed:@"weixin@2x副本"] forState:UIControlStateNormal];
       [weixinBtn addTarget:self action:@selector(touchWeixinBtn) forControlEvents:UIControlEventTouchUpInside];
    weixinBtn.frame = CGRectMake(AppWidth*0.2, maxY(sinaBtn)+5, AppWidth*0.64, AppWidth*0.18);
    [self.view addSubview:weixinBtn];
    
//
//    UIImageView *linc1 = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"blackLine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    linc1.frame = CGRectMake(13, 515, 343, 22);
//    [view addSubview:linc1];
//    
//    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"messageSelected"] forState:UIControlStateSelected];
    messageBtn.frame = CGRectMake(AppWidth*0.2, maxY(weixinBtn)+10, AppWidth*0.64, AppWidth*0.18);
    [messageBtn addTarget:self action:@selector(touchesMessageBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messageBtn];
    

    UIButton *setingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [setingBtn setBackgroundImage:[UIImage imageNamed:@"seting"] forState:UIControlStateNormal];
    [setingBtn setBackgroundImage:[UIImage imageNamed:@"setingSelected"] forState:UIControlStateSelected];
    setingBtn.frame = CGRectMake(AppWidth*0.2, maxY(messageBtn)+5, AppWidth*0.64, AppWidth*0.18);
    [setingBtn addTarget:self action:@selector(touchesSetingButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setingBtn];
   
}
- (void)touchesSetingButton {
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    SetingViewController *svc = [SetingViewController new];
    
    [centerNav pushViewController:svc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];
}
- (void)touchesMessageBtn {
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    FavourtViewController *fvc = [FavourtViewController new];
    
    [centerNav pushViewController:fvc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];

}
- (void)touchesHomeBtn {
     AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    MainViewController *mvc = [MainViewController new];
    
    [centerNav pushViewController:mvc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];

}
- (void)touchesFoundBtn {
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    FoundViewController *fvc = [FoundViewController new];
    
    [centerNav pushViewController:fvc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];
    
}
- (void)touchSinaBtn {
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    MainViewController *mvc = [MainViewController new];
    
    [centerNav pushViewController:mvc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];
    LoginView *loginView = [LoginView LoginView];
    [loginView showLoginViewToView:centerNav.view];
    
}
- (void)touchWeixinBtn {
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    UINavigationController *centerNav = appDelegate.centerNav;
    MainViewController *mvc = [MainViewController new];
    
    [centerNav pushViewController:mvc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];
    LoginView *loginView = [LoginView LoginView];
    [loginView showLoginViewToView:centerNav.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
