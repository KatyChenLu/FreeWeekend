//
//  DetailViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "DetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailModel.h"
#import "DetailView.h"
#import "UIView+Common.h"
#import "GotoPayForView.h"
#import "DBManager.h"
//#import <FMDB/FMDB.h>
//#import <UMengSocial/UMSocial.h>
////邮件
//#import <MessageUI/MessageUI.h>
@interface DetailViewController ()<DetailButtonClickDelegate,UIScrollViewDelegate> {
    DetailView *_detailView;
    UIScrollView *_scrollView;
    UIButton *_backButton;
    UIButton *_shareButton;
    UIButton *_heartButton;
//    UIButton *_helpButton;
    CGFloat _scrollviewOffset;
    UIImageView *_backgroundImage;
    //    BOOL _isHeart;
    BOOL _isExistRecord1;
}
@property (nonatomic, strong) UIView *naviView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUrl];
    self.view.backgroundColor = BACKGROUNDCOLOR;
    //    self.navigationController.navigationBarHidden = YES;
    [self createScrollView];
    
//    [self createMyNavigtionBar];
    [self createGotoPay];
}
- (void)createGotoPay {
    GotoPayForView *gotoPay = [GotoPayForView new];
    gotoPay.frame = CGRectMake(0, AppHeight-45, AppWidth, 45);
    [self.view addSubview:gotoPay];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    
    [self createMyNavigtionBar];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)createUrl {
    NSString *url = [NSString stringWithFormat:DetailURL,_leoId];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        DetailModel *model = [[DetailModel alloc] initWithData:responseObject error:nil];
        _detailView.model = model;
        [self resetScrollViewFrame];
        //        [self refreshDetailUI];
//        NSLog(@"%@",model);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}



- (void)resetScrollViewFrame {
    _detailView.frame = CGRectMake(0, 10, width(_scrollView), _detailView.viewHeight);
//    NSLog(@"%f",width(_scrollView));
    _scrollView.contentSize = CGSizeMake(width(self.view), _detailView.viewHeight);
    _scrollView.delegate = self;
//    NSLog(@"%@",NSStringFromCGSize(_scrollView.contentSize));
}

- (void)createMyNavigtionBar {
    
    _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 64)];
    _naviView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask"]];
    
    
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _backButton.frame = CGRectMake(5, 30, 30, 30);
    [_backButton setImage:[[UIImage imageNamed:@"ic_nav_left_white@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(touchBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:_backButton];
    
    _shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _shareButton.frame = CGRectMake(AppWidth-66, 30, 30, 30);
    //    [_shareButton setImage:[[UIImage imageNamed:@"ic_nav_share_white@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_shareButton addTarget:self action:@selector(shareBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:_shareButton];
    
    _heartButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _heartButton.frame = CGRectMake(AppWidth-33, 30, 30, 30);
    
//    if (_isExistRecord1) {
//         [_heartButton setImage:[[UIImage imageNamed:@"ic_nav_black_heart_on@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }
    //
    
    //从数据库是否有收藏记录
    BOOL isExistRecord = [[DBManager sharedManager] isExistAppForAppId:_fModel.leo_id];
     NSString *imageName = isExistRecord?@"ic_nav_black_heart_on@3x":@"ic_nav_heart_white_off@3x";
    [_heartButton setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    
//    if (isExistRecord) {
//         [_heartButton setImage:[[UIImage imageNamed:@"ic_nav_black_heart_on@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }

    
    [_heartButton addTarget:self action:@selector(hearBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:_heartButton];
    
//    _helpButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    _helpButton.frame = CGRectMake(AppWidth-30, 30, 30, 30);
//    //    [_helpButton setImage:[[UIImage imageNamed:@"ic_nav_help_white@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    [_helpButton addTarget:self action:@selector(helpBackButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_naviView addSubview:_helpButton];
    
    [self.view addSubview:self.naviView];
    
}
- (void)hearBackButton:(UIButton *)button{

        //从数据库是否有收藏记录
        BOOL isExistRecord = [[DBManager sharedManager] isExistAppForAppId:_fModel.leo_id];
        /**
         *  如果收藏过了,在点击即取消收藏
         */
    
        if (isExistRecord) {
            [[DBManager sharedManager] deleteModelForAppId:_fModel.leo_id];
            NSString *imageName = isExistRecord?@"ic_nav_heart_white_off@3x":@"ic_nav_black_heart_on@3x";
            _heartButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
            _heartButton.alpha= 1.0;
            [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            
        }else {
            NSString *imageName = isExistRecord?@"ic_nav_heart_white_off@3x":@"ic_nav_black_heart_on@3x";
            [[DBManager sharedManager] insertModel:_fModel];
            [UIView animateWithDuration:0.3 animations:^{
                   [_heartButton setBackgroundImage:nil forState:UIControlStateNormal];
                [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                _heartButton.transform = CGAffineTransformMakeScale(2.0, 2.0);
                
                _heartButton.alpha = 0.0;
            } completion:^(BOOL finished) {
                [_heartButton setBackgroundImage:nil forState:UIControlStateNormal];
                [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                _heartButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
                _heartButton.alpha= 1.0;
                
            }];

        }
        _isExistRecord1 = [[DBManager sharedManager] isExistAppForAppId:_fModel.leo_id];
    //[self refreButton:_isExistRecord1];
    
}
- (void)refreButton:(BOOL)isFavourete imageName:(NSString *)imageName{
//    NSString *imageName = isFavourete?@"ic_nav_black_heart_on@3x":@"ic_nav_heart_white_off@3x";
    if (isFavourete) {
          [UIView animateWithDuration:0.3 animations:^{
                [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
              _heartButton.transform = CGAffineTransformMakeScale(2.0, 2.0);
          
              _heartButton.alpha = 0.0;
          } completion:^(BOOL finished) {
               [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
              _heartButton.transform = CGAffineTransformMakeScale(1.0, 1.0);

              _heartButton.alpha= 1.0;
         
          }];
    }else if (!isFavourete){
        _heartButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
        _heartButton.alpha= 1.0;
         [_heartButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
 
}

- (void)shareBackButton:(UIButton *)button {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"分享" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"邮件" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:action1];
    [controller addAction:action2];
    [controller addAction:action3];
    [self presentViewController:controller animated:YES completion:^{
//        NSLog(@"视图弹出完毕");
    }];

}
- (void)touchBackButton:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, AppHeight)];
    
    // 取消延时响应
    _scrollView.delaysContentTouches = NO;
    [self.view addSubview:_scrollView];
    
    _detailView = [[DetailView alloc] initWithFrame:CGRectMake(0, 0, width(_scrollView), 0)];
    _detailView.delegate = self;
    [_scrollView addSubview:_detailView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _scrollviewOffset = _scrollView.contentOffset.y; 
//    NSLog(@"*******%fd",_scrollviewOffset);
    [_backButton setBackgroundImage:nil forState:UIControlStateNormal];
    
    if (_scrollviewOffset <= 100) {
        _naviView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask"]];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_left_white@3x"] forState:UIControlStateNormal];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_share_white@3x"] forState:UIControlStateNormal];
//        [_heartButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_heart_white_off@3x"] forState:UIControlStateNormal];
//        [_helpButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_help_white@3x"] forState:UIControlStateNormal];
         NSString *imageName = _isExistRecord1?@"ic_nav_black_heart_on@3x":@"ic_nav_heart_white_off@3x";
        [self refreButton:_isExistRecord1 imageName:imageName];
    }
    if (_scrollviewOffset > 100 && _scrollviewOffset <288) {
        [_backgroundImage removeFromSuperview];
        _naviView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0035*_scrollviewOffset];
        [self.view addSubview:_backgroundImage];
        
        //[self refreButton:_isExistRecord1];
        
    }else if (_scrollviewOffset >= 288){
        
        
        _naviView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_left@3x"] forState:UIControlStateNormal];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_share_black@3x"] forState:UIControlStateNormal];
        
//        [_helpButton setBackgroundImage:[UIImage imageNamed:@"ic_nav_help@3x"] forState:UIControlStateNormal];

        NSString *imageName = _isExistRecord1?@"ic_nav_black_heart_on@3x":@"ic_nav_black_heart_off@3x";
        [self refreButton:_isExistRecord1 imageName:imageName];

    }
    
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    
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
