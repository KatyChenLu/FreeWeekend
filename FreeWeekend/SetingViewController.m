//
//  SetingViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "SetingViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "UIView+Common.h"
#import "JWCache.h"
#import "AboutViewController.h"

@interface SetingViewController () {
    UIButton *_clearButton;
    UIButton *_abountButton;
//    UIButton *_askButton;
    UILabel *_versionLabel;
    UILabel *_label;
}

@end

@implementation SetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"设置";
    titleLabel.tintColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:25];
    titleLabel.frame = CGRectMake(0, 0, width(self.view)/4, 50);
    
    self.navigationItem.titleView =titleLabel;
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, AppWidth, AppHeight);
    UIImageView *background = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"4.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    background.frame = CGRectMake(0, 0, AppWidth, AppHeight);
    background.alpha = 0.5;
    [self.view addSubview:background];
      [self createNav];
    [self creatView];
    
}
- (void)createNav {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *catMe = [UIImage imageNamed:@"cat_me"] ;
    
    [button setBackgroundImage:catMe forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 50, 51);
    button.transform = CGAffineTransformMakeScale(0.6, 0.6);
    [button addTarget:self action:@selector(touchesCatMe:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}
- (void)touchesCatMe:(UIButton *)button {
    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
    }];
}
- (void)creatView {
    _abountButton = [UIButton new];
    [_abountButton setTitle:@"关于我们" forState:UIControlStateNormal];
    [_abountButton addTarget:self action:@selector(abountButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_abountButton setTitleColor:BLACKCOLOR forState:UIControlStateNormal];
    _abountButton.frame = CGRectMake(0, 0, 0.5*AppWidth, 30);
    _abountButton.center = CGPointMake(AppWidth/2, AppHeight*0.3);
    _abountButton.layer.borderColor = [BLACKCOLOR CGColor];
    _abountButton.layer.borderWidth = 2;
    _abountButton.layer.cornerRadius = 15;
    _abountButton.layer.masksToBounds = YES;
    
    
    _clearButton = [UIButton new];
    [_clearButton setTitle:@"清理缓存" forState:UIControlStateNormal];
    [_clearButton setTitleColor:BLACKCOLOR forState:UIControlStateNormal];
    [_clearButton addTarget:self action:@selector(clearButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _clearButton.frame = CGRectMake(0, 0, 0.5*AppWidth, 30);
    _clearButton.center = CGPointMake(AppWidth/2, maxY(_abountButton)+50);
    _clearButton.layer.borderColor = [BLACKCOLOR CGColor];
    _clearButton.layer.borderWidth = 2;
    _clearButton.layer.cornerRadius = 15;
    _clearButton.layer.masksToBounds = YES;
    
    
//    _askButton = [UIButton new];
//    [_askButton setTitle:@"问题反馈" forState:UIControlStateNormal];
//    [_askButton setTitleColor:BLACKCOLOR forState:UIControlStateNormal];
//    [_askButton addTarget:self action:@selector(askButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    _askButton.frame = CGRectMake(0, 0, 0.5*AppWidth, 30);
//    _askButton.center = CGPointMake(AppWidth/2, maxY(_clearButton)+50);
//    _askButton.layer.borderColor = [BLACKCOLOR CGColor];
//    _askButton.layer.borderWidth = 2;
//    _askButton.layer.cornerRadius = 15;
//    _askButton.layer.masksToBounds = YES;
    
    _versionLabel = [UILabel new];
    _versionLabel.text = @"v1.0.0";
    _versionLabel.textColor = BLACKCOLOR;
    _versionLabel.frame = CGRectMake(0, 0, 0.5*AppWidth, 20);
    _versionLabel.center = CGPointMake(AppWidth/2, maxY(_clearButton)+20);
    _versionLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_abountButton];
    [self.view addSubview:_clearButton];
//    [self.view addSubview:_askButton];
    [self.view addSubview:_versionLabel];
    
}
- (void)abountButtonAction:(UIButton *)button{
    
    AboutViewController * avc = [AboutViewController new];
    
    
      [self.navigationController pushViewController:avc animated:YES];
}

//- (void)askButtonAction:(UIButton *)button{
//    AskViewController * avc = [AskViewController new];
//    
//    
//    [self.navigationController pushViewController:avc animated:YES];
//}
- (void)clearButtonAction:(UIButton *)button{
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你确定要清理吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        
        [JWCache resetCache];
        _label.text = [NSString stringWithFormat:@"缓存%.2fM",[JWCache fileSize]];
        
    }];
    //可以添加多个，会分行处理
    //    UIAlertAction *okAction1 = [UIAlertAction actionWithTitle:@"好啊" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
    //
    // }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    // 创建警告按钮   不可以添加进去，会崩
    //    UIAlertAction *structAction = [UIAlertAction actionWithTitle:@"换存已全部清理" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    //
    //
    //    }];
    
    // 添加按钮
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    //[alertController addAction:structAction];
    // 将UIAlertController模态出来 相当于UIAlertView show 的方法
    [self presentViewController:alertController animated:YES completion:nil];
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
