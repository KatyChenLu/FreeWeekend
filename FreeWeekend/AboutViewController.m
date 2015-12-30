//
//  AboutViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "AboutViewController.h"
#import "UIView+Common.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *postItem=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_nav_left@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(post:)];
    self.navigationItem.leftBarButtonItem = postItem;
    
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"关于我们";
    titleLabel.tintColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:25];
    titleLabel.frame = CGRectMake(0, 0, width(self.view)/4, 50);
    
    self.navigationItem.titleView =titleLabel;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, AppWidth, AppHeight);
    UIImageView *background = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"3.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    background.frame = CGRectMake(0, 0, AppWidth, AppHeight);
    background.alpha = 0.5;
    [self.view addSubview:background];
   
     [self creatView];

}
-(void)post:(UIBarButtonItem * )back{
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)creatView {
    UIImageView *icon = [UIImageView new];
    icon.image = [[UIImage imageNamed:@"Icon-152"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    icon.backgroundColor = [UIColor redColor];
    icon.frame = CGRectMake(0, 0, 50, 50);
    icon.center = CGPointMake(AppWidth/2, AppHeight*0.3);
    icon.layer.cornerRadius = 20;
    icon.layer.masksToBounds = YES;
    [self.view addSubview:icon];
    
    
    UILabel *label = [UILabel new];
    label.text = @"    「闲猫简介」 在这里，每一个周末都是惊喜！小闲猫帮你发现周末的美好去处，享受轻松优雅的生活方式。\n   「魅力闲猫」 周末不只是红酒配电影，每个城市都有你没去过的地方，每个周末都有你不知道的精彩： 技能交换，集市，陶社，手作，皮具，扎染，银饰，私厨，地下电影，读书会，音乐节，美食分享会，设计展，温泉，周边游。\n 「闲猫特性」 贴心：无需手动操作，根据兴趣爱好自动推荐活动。 精致：活动都由小编大人细心挑选审核、手动编辑。 美好：逃离沉闷的小窝，出来寻找三两知己吧！ 快乐：忘却纷扰，在周末尽情地释放自我，享受生活！\n\n 「联系我们」 微信平台：veracl";
    label.textColor = BLACKCOLOR;
    label.frame = CGRectMake(AppWidth*0.2, maxY(icon)+30, AppWidth*0.6, AppHeight-maxY(icon)-30);
    label.font = CUTEFONT;
    
    label.numberOfLines = 0;
   
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
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
