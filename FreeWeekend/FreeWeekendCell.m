//
//  FreeWeekendCell.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "FreeWeekendCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+Common.h"

@interface FreeWeekendCell ()<UIGestureRecognizerDelegate>

@end

@implementation FreeWeekendCell {
    UIImageView *_frontImageView;
    UILabel *_titleLabel;
    UILabel *_poiDistanceAndCategory;
    UILabel *_timeInfoLabel;
    
    UIImageView *_heatView;
    UILabel *_collectedLabel;
    
    UIView *_collectedNumView;
    UILabel *_priceLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self contentViews];
    }
    
    return  self;
}
- (void)contentViews {
    _frontImageView = [UIImageView new];
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:20];
    _titleLabel.tintColor = TINTCOLOR;
    [_titleLabel setNumberOfLines:0];
    
    
    
    _poiDistanceAndCategory = [UILabel new];
    _poiDistanceAndCategory.font = FONT;
    _poiDistanceAndCategory.textColor = [UIColor lightGrayColor];
    _poiDistanceAndCategory.layer.borderColor = [TINTCOLOR CGColor];
    
    _timeInfoLabel = [UILabel new];
    _timeInfoLabel.font = CUTEFONT;
    _timeInfoLabel.textColor = TINTCOLOR;
    _timeInfoLabel.layer.borderWidth = 2;
    _timeInfoLabel.layer.borderColor = [TINTCOLOR CGColor];
    _timeInfoLabel.layer.cornerRadius = 5;
    _timeInfoLabel.adjustsFontSizeToFitWidth = YES;
    
    _collectedLabel = [UILabel new];
    _collectedLabel.font = CUTEFONT;
    _collectedLabel.textColor = TINTCOLOR;
    _heatView = [UIImageView new];
    
    _collectedNumView = [UIView new];
    _collectedNumView.layer.borderWidth = 2;
    _collectedNumView.layer.borderColor = [TINTCOLOR CGColor];
    _collectedNumView.layer.cornerRadius = 5;
    
    _collectedNumView.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *geture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesCollect:)];
    [_collectedNumView addGestureRecognizer:geture];
    geture.cancelsTouchesInView = YES;
    geture.delegate = self;
    
    _priceLabel = [UILabel new];
    _priceLabel.font = CUTEFONT;
    _priceLabel.layer.borderWidth = 2;
    _priceLabel.textColor = TINTCOLOR;
    _priceLabel.layer.borderColor = [TINTCOLOR CGColor];
    _priceLabel.layer.cornerRadius = 5;
    _priceLabel.adjustsFontSizeToFitWidth = YES;
    
    
    [self.contentView addSubview:_frontImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_poiDistanceAndCategory];
    [self.contentView addSubview:_timeInfoLabel];
    [self.contentView addSubview:_collectedNumView];
    [self.contentView addSubview:_priceLabel];
    
    
}
- (void)touchesCollect:(UITapGestureRecognizer *)gestur {
    static int i=0;
    i++;
//    NSLog(@"%d",i);
}
- (void)setModel:(ResultModel *)model {
    _model = model;
    

        [_frontImageView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_image_list[0]] placeholderImage:[UIImage imageNamed:@"loading_image@3x"]];
//    _frontImageView.contentMode = UIViewContentModeScaleAspectFit;
        _titleLabel.text = model.title;
    

        NSString *distanceNum = [NSString stringWithFormat:@"%ldkm",[model.distance integerValue]/1000];
        _poiDistanceAndCategory.text = [NSString stringWithFormat:@"%@   ·   %@   ·   %@",model.poi_name,distanceNum,model.category];
        [_poiDistanceAndCategory sizeToFit];

        _timeInfoLabel.text = model.time_info;
    

    
    if (_collectedLabel.text.length == 0) {
        _heatView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_nav_black_heart_off@3x"]];
        _heatView.frame = CGRectMake(5, 5, 20, 20);
        _collectedLabel = [[UILabel alloc]init];
        _collectedLabel.text = [NSString stringWithFormat:@"%@人收藏",model.collected_num];
        _collectedLabel.frame = CGRectMake(25, 5, 80, 20);
        _collectedLabel.font = FONT;
        _collectedLabel.textColor = TINTCOLOR;
        
        [_collectedNumView addSubview:_heatView];
        [_collectedNumView addSubview:_collectedLabel];
//        [_collectedNumView sizeToFit];
    }
    

        _priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
//        [_priceLabel sizeToFit];
//    [self setViewFrames];
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat leftPadding = 8;
    CGFloat topPadding = 8;
    CGFloat padding = 5;
    
    _frontImageView.frame = CGRectMake(0, 0, screenWidth(), 0.6*screenWidth());//640*460   1135
    _titleLabel.frame = CGRectMake(leftPadding, maxY(_frontImageView)+topPadding, screenWidth()-2*leftPadding, 30);
    _poiDistanceAndCategory.frame = CGRectMake(minX(_titleLabel), maxY(_titleLabel)+topPadding, screenWidth()-2*leftPadding, 30);
    
    
      CGSize timeSize = [self sizeWithText:_model.time_info maxSize:CGSizeMake(CGFLOAT_MAX, 30) font:FONT];
    
    _timeInfoLabel.frame = CGRectMake(padding, maxY(_poiDistanceAndCategory)+topPadding, timeSize.width+padding, 30);
    _timeInfoLabel.textAlignment = NSTextAlignmentCenter;
    
    CGSize collectSize = [self sizeWithText:_collectedLabel.text maxSize:CGSizeMake(CGFLOAT_MAX, 30) font:FONT];
    
    _collectedNumView.frame = CGRectMake(maxX(_timeInfoLabel)+padding, minY(_timeInfoLabel), collectSize.width+_heatView.image.size.width+padding, 30);
    
    
    CGSize priceSize = [self sizeWithText:_priceLabel.text maxSize:CGSizeMake(CGFLOAT_MAX, 30) font:FONT];
    
    _priceLabel.frame =CGRectMake(screenWidth()-leftPadding - priceSize.width, minY(_timeInfoLabel), priceSize.width+padding, 30);
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    
    
}
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
