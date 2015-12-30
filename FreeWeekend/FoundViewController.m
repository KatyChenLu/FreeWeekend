//
//  FoundViewController.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "FoundViewController.h"
#import "FreeWeekendModel.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "FreeWeekendCell.h"
#import "UIView+Common.h"
#import "DetailViewController.h"
#import "DetailModel.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "LeftViewController.h"
#import "FavouriteModel.h"
#import "JWCache.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "NSString+Common.h"
@interface FoundViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    AFHTTPRequestOperationManager *_manager;
}


@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self downLoadFromNet];
    [self createTableView];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"闲人周末";
    titleLabel.tintColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:25];
    titleLabel.frame = CGRectMake(0, 0, width(self.view)/4, 50);
    
    self.navigationItem.titleView =titleLabel;
    
}


- (void)downLoadFromNet:(BOOL)isMore {
    NSInteger page = 2;
    NSString *url = nil;
    if (isMore) {
        if (_dataArray.count%10 != 0) {
            return;
        }
        page = _dataArray.count/10 + 1;
    }
    
    url = [NSString stringWithFormat:MainURL,page];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSData *cacheData = [JWCache objectForKey:MD5Hash(url)];
    if (cacheData) {
        FreeWeekendModel *model = [[FreeWeekendModel alloc] initWithData:cacheData error:nil];
        if (isMore) {
            [_dataArray addObjectsFromArray:model.result];
        }else {
            [_dataArray removeAllObjects];
            [_tableView reloadData];
            _dataArray = model.result;
        }
        [_tableView reloadData];
        // 隐藏 loading 提示框
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        return;
    }
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        FreeWeekendModel *model = [[FreeWeekendModel alloc]initWithData:responseObject error:nil];
        
        if (isMore) {
            //            [_dataArray addObject:model.result];
            [_dataArray addObjectsFromArray:model.result];
        }else {
            [_dataArray removeAllObjects];
            [_tableView reloadData];
            _dataArray = model.result;
        }
        [_tableView reloadData];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        // 隐藏 loading 提示框
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        // 把数据进行缓存
        [JWCache setObject:responseObject forKey:MD5Hash(url)];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",[error description]);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        
    }];
    
}

- (void)createNavigationItem {
    //左
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
    //增加代码健全性
    if (_tableView == nil) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
    }
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"下拉刷新");
        [self downLoadFromNet:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        NSLog(@"加载更多");
        [self downLoadFromNet:YES];
    }];
    _tableView.mj_footer = footer;
    
    [_tableView.mj_header beginRefreshing];
  
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AppWidth*0.6+122;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (FreeWeekendCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identidier=@"cellId";
    
    FreeWeekendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[FreeWeekendCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier];
        // 设置选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ResultModel *model = _dataArray[indexPath.row];
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.leoId = model.leo_id;
    
    FavouriteModel *favouriteModel = [[FavouriteModel alloc]init];
    favouriteModel.title = model.title;
    favouriteModel.time_info = model.time_info;
    favouriteModel.leo_id = model.leo_id;
    favouriteModel.front_cover_image_list = model.front_cover_image_list[0];
    detailViewController.fModel = favouriteModel;
    
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self createNavigationItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
