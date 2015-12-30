//
//  DetailFootView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "DetailFootView.h"

@implementation DetailFootView

- (void)awakeFromNib {
  
}

+(instancetype)detailFootView {
    DetailFootView *footView = [[NSBundle mainBundle] loadNibNamed:@"DetailFootView" owner:nil options:nil][0];
    return footView;
}

@end
