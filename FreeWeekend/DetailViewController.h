//
//  DetailViewController.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavouriteModel.h"

@interface DetailViewController : UIViewController

@property (nonatomic, copy)NSString *leoId;
@property (nonatomic, copy)FavouriteModel *fModel;

@end
