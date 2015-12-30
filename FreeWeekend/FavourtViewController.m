//
//  FavourtViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "FavourtViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "UIView+Common.h"
#import "DetailModel.h"
#import "DBManager.h"
#import "FavouriteModel.h"
#import <UIImageView+WebCache.h>
#import "FavourtTableViewCell.h"
@interface FavourtViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation FavourtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    _dataArray = [[NSMutableArray alloc]init];
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"我的消息";
    titleLabel.tintColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:25];
    titleLabel.frame = CGRectMake(0, 0, width(self.view)/4, 50);
    
    self.navigationItem.titleView =titleLabel;
    
    
    
    [self getDataFromDB];
    [self createTableView];
    
}
- (void)getDataFromDB {
    
   NSArray *models = [[DBManager sharedManager] readModels];
    
    [_dataArray addObjectsFromArray:models];
    
    [_tableView reloadData];
    
//     [[DBManager sharedManager] deleteModelForAppId:model.leo_target_id];
//    DetailModel *modek =
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
-(void)createTableView
{
    
    
    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"1.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    background.alpha = 0.5;
    _tableView.backgroundView = background;
    
    [self.view addSubview:_tableView];
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    static NSString *identidier=@"cellId";
    
    FavourtTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[FavourtTableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier];
        // 设置选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.model = _dataArray[indexPath.row];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AppWidth*0.28;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
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
