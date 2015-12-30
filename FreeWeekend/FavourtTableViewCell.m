//
//  FavourtTableViewCell.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "FavourtTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+Common.h"
@interface FavourtTableViewCell (){
    UIImageView *_favourtImageView;
    UIImageView *_imageView;
    UILabel *_title;
    UILabel *_timeInfo;
}



@end



@implementation FavourtTableViewCell
-(void)setModel:(FavouriteModel *)model{
    
    _model = model;
    
    UILabel * label = [UILabel new];
    label.frame = CGRectMake(0.05*AppWidth, 0, 2, 0.28*AppWidth);
    label.layer.borderColor = [TINTCOLOR CGColor];
    label.layer.borderWidth = 1;
    [_favourtImageView addSubview:label];
    UIImageView *imageh = [UIImageView new];
    imageh.image = [[UIImage imageNamed:@"ic_nav_black_heart_on@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imageh.frame = CGRectMake(0, 0, 20, 20);
    imageh.center = CGPointMake(label.center.x, 0.28*0.2*AppWidth);
    [_favourtImageView addSubview:imageh];
    
//       _favourtImageView.image = [UIImage imageNamed:@"favourtHeart"];//65*180
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_image_list] placeholderImage:[UIImage imageNamed:@"loading_image"]];
    
    
    _title.text = model.title;
    _title.font = DESCFONT;
    _timeInfo.text = model.time_info;
    _timeInfo.font = FONT;
}
- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self contentViews];
    }
    
    return  self;
}
- (void)contentViews {
    _favourtImageView = [UIImageView new];
    _imageView =[UIImageView new];
    _title  = [UILabel new];
    _title.textColor = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0];
    _timeInfo = [UILabel new];
    _timeInfo.textColor = TINTCOLOR;
//    _timeInfo.adjustsFontSizeToFitWidth = YES;
    _timeInfo.textAlignment = NSTextAlignmentCenter;
    
    
    [self.contentView addSubview:_favourtImageView];
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_title];
    [self.contentView addSubview:_timeInfo];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat padding = 10;
    _favourtImageView.frame = CGRectMake(0, 0, 0.1*AppWidth, 0.28*AppWidth);
    _imageView.frame = CGRectMake(maxX(_favourtImageView), 0, 0.3*AppWidth, 0.2*AppWidth);
    _title.frame = CGRectMake(maxX(_imageView)+padding, 0, AppWidth-maxX(_imageView)-padding, 50);
    _timeInfo.frame = CGRectMake(AppWidth-200, 0.28*AppWidth-30-padding, 200, 30);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
