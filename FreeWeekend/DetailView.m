//
//  DetailView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "DetailView.h"
#import "UIView+Common.h"
#import <UIImageView+WebCache.h>
#import "DetailFootView.h"
@interface DetailView ()<UIScrollViewDelegate>

@end


@implementation DetailView {
   
    UIScrollView *_imageScrollView;
    UILabel *_titleLabel;
    //类型和钱
    UIImageView *_iconImageView;
    UILabel *_iconName;
    UILabel *_priceInfo;
    UIView *_iconViewNamePriceInfoView;
    
    UILabel *_timeInfoLabel;
    UIImageView *_separateLine;
    //地址
    UILabel *_addressLabel;
    UIImageView *_mapBackImageView;
    UIView *_addressAndProviderView;
    //详情标题
    UIImageView *_leftLine;
    UIImageView *_rightLine;
    UIImageView *_dot1; //imaginaryLine@2xsplitbg@2x------点
    UILabel *_actionXQLabel;//
    UIImageView *_dot2;
    UIView *_actionView;
    
    UILabel *_descriptionLabel;//详情
    //    UILabel *_bookingPolicyView;//预订须知
    
    UIImageView *_share;
    UILabel *_shareLabel;
    UIView *_shareView;
    
    UIImageView *_favourite;
    UILabel *_favouritLabel;
    UIView *_favouritView;
    
    UIImageView *_consult;
    UILabel *_consultLabel;
    UIView *_consultView;
    
    CGFloat lastHight;
    UIImageView *_imageView;

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customViews];
    }
    return self;
}
- (void)customViews {
    
    
    
    self.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    _imageScrollView = [UIScrollView new];
    _titleLabel = [UILabel new];
    _titleLabel.font = DETAILFONT;
    
    _iconImageView = [UIImageView new];
    _iconName = [UILabel new];
    _iconName.font = DETAILFONT;
    _priceInfo = [UILabel new];
    _iconViewNamePriceInfoView = [UIView new];
    [_iconViewNamePriceInfoView addSubview:_iconImageView];
       [_iconViewNamePriceInfoView addSubview:_iconName];
    [_iconViewNamePriceInfoView addSubview:_priceInfo];
    
    
    _timeInfoLabel = [UILabel new];
    _timeInfoLabel.font = DESCFONT;
    _timeInfoLabel.textColor =TINTCOLOR;
    //分割线
    _separateLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separateLine"]];//510*1
    
    //地址
    _addressLabel = [UILabel new];
    _mapBackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapBack"]];//67*74
    _addressAndProviderView = [UIView new];
    [_addressAndProviderView addSubview:_addressLabel];
    [_addressAndProviderView addSubview:_mapBackImageView];
    
    //详情标题
    _leftLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_line"]];//110*1
    _dot1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dot"]];//5*5
    _actionXQLabel = [[UILabel alloc] init];//
    _actionXQLabel.text = @"活动详情";
    _actionXQLabel.font = DESCFONT;
    _dot2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dot"]];
    _rightLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_line"]];//110*1
    _actionView = [UIView new];
    [_actionView addSubview:_leftLine];
    [_actionView addSubview:_dot1];
    [_actionView addSubview:_actionXQLabel];
    [_actionView addSubview:_dot2];
    [_actionView addSubview:_rightLine];
    
    _descriptionLabel = [UILabel new];//
    _descriptionLabel.font = DESCFONT;
    _descriptionLabel.numberOfLines = 0;
    _descriptionLabel.textColor = [UIColor grayColor];
    
    
    //    _bookingPolicyView = [UILabel new];//
    
    _share = [UIImageView new];
    //    [_shareButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    _shareLabel = [UILabel new];
    _shareView = [UIView new];
    [_shareView addSubview:_share];
    [_shareView addSubview:_shareLabel];
    
    _favourite = [UIImageView new];
    //    [_favouriteButton addTarget:self action:@selector(favouriteAction:) forControlEvents:UIControlEventTouchUpInside];
    _favouritLabel = [UILabel new];
    _favouritView = [UIView new];
    [_favouritView addSubview:_favourite];
    [_favouritView addSubview:_favouritLabel];
    
    _consult = [UIImageView new];
    //    [_consultButton addTarget:self action:@selector(consultAction:) forControlEvents:UIControlEventTouchUpInside];
    _consultLabel = [UILabel new];
    _consultView = [UIView new];
    [_consultView addSubview:_consult];
    [_consultView addSubview:_consultLabel];
    
//    _footView = [DetailFootView new];

    
    
    [self addSubview:_imageScrollView];
    [self addSubview:_titleLabel];
    
    [self addSubview:_iconViewNamePriceInfoView];
    
    [self addSubview:_timeInfoLabel];
    [self addSubview:_separateLine];//分割线
    
    [self addSubview:_addressAndProviderView];
    
    [self addSubview:_actionView];
    
    [self addSubview:_descriptionLabel];
    
    //    [self addSubview:_bookingPolicyView];
    [self addSubview:_shareView];
    [self addSubview:_favouritView];
    [self addSubview:_consultView];
    
}
//- (void)shareAction:(UIButton *)button {
//
//}
//- (void)favouriteAction:(UIButton *)button {
//
//}
//- (void)consultAction:(UIButton *)button {
//
//}
- (void)setModel:(DetailModel *)model {
    _model = model;
    
    _titleLabel.text = _model.result.title;
    _titleLabel.textColor = [UIColor colorWithRed:79/255.0 green:79/255.0  blue:79/255.0  alpha:1.0];
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_model.result.category.icon_view]];
    _iconName.text = _model.result.category.cn_name;
    _priceInfo.text = [NSString stringWithFormat:@"￥%@",_model.result.price_info];
    _priceInfo.textColor = TINTCOLOR;
    _priceInfo.adjustsFontSizeToFitWidth = YES;
    
    
    _iconViewNamePriceInfoView.backgroundColor = [UIColor whiteColor];
    _iconViewNamePriceInfoView.layer.borderWidth = 1;
    _iconViewNamePriceInfoView.layer.borderColor = [[UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1.0] CGColor];
    
    _timeInfoLabel.text = _model.result.time.info;
    //    _separateLine
    
    _addressLabel.text = [NSString stringWithFormat:@"%@  ·   %@",_model.result.address,_model.result.title];
    _addressLabel.numberOfLines = 0;
    
    
    NSInteger padding = 20;
    NSInteger descriptionNum = _model.result.Ddescription.count;
    for (NSInteger i = 0; i < descriptionNum; i++) {
        //        static CGFloat lastHight = 0;
        
        DDescription *model = _model.result.Ddescription[i];
        if (model) {
            if ([model.type isEqualToString:@"text"]) {
                UILabel *label = [[UILabel alloc]init];
                label.text = model.content;
                label.numberOfLines = 0;
                label.font = FONT;
                label.textColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1.0];
                CGSize labelSize = [self sizeWithText:label.text maxSize:CGSizeMake(width(self), CGFLOAT_MAX) font:FONT];
                
                
                label.frame = CGRectMake(10, lastHight, width(self), labelSize.height);
                
                
                lastHight = lastHight + labelSize.height+padding;
                [_descriptionLabel addSubview:label];
            }else if ([model.type isEqualToString:@"image"]) {
                UIImageView *imageView = [UIImageView new];
                [imageView sd_setImageWithURL:[NSURL URLWithString:model.content]];
                imageView.frame = CGRectMake(0, lastHight, width(self), width(self)*2/3);
                lastHight = lastHight + width(self)*2/3 + padding;
                [_descriptionLabel addSubview:imageView];
            }
        }
    }
    

    
    [self setViewFrames];
    
}
- (void)setViewFrames {
    CGFloat leftPadding = 10;
    CGFloat topPadding = 10;
    CGFloat padding = 10;
    //滑动视图
   _mageConunt = _model.result.images.count;
    CGFloat imageHeight = 2*AppWidth/3;
    CGFloat imageWidth = width(self);
    for (int i = 0; i < _mageConunt; i++) {
        NSString *imagesName = _model.result.images[i];
       _imageView = [[UIImageView alloc]init];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:imagesName] placeholderImage:[UIImage imageNamed:@"loading_image@3x"]];
        _imageView.frame = CGRectMake(i*imageWidth, 0, imageWidth, imageHeight);
        _imageView.userInteractionEnabled = YES;
//         UITapGestureRecognizer* tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction:)];//给imageview添加tap手势
//        [_imageView addGestureRecognizer:tap];
        
        
//        float minimumScale = [_imageScrollView frame].size.width / [_imageView frame].size.width;//设置缩放比例
//        [_imageScrollView setMinimumZoomScale:minimumScale];//设置最小的缩放大小
//        [_imageScrollView setZoomScale:minimumScale];//设置scrollview的缩放
//        //    [_scrollView setMaximumZoomScale:10000000.0];//设置最大的缩放大小
        
        [_imageScrollView addSubview:_imageView];
    }
    
    
    
    _imageScrollView.pagingEnabled = YES;
    _imageScrollView.contentSize = CGSizeMake(_mageConunt*imageWidth, imageHeight);
    _imageScrollView.showsHorizontalScrollIndicator = NO;
    _imageScrollView.frame = CGRectMake(0, 0, imageWidth, imageHeight);
    _imageScrollView.delegate = self;
    
    _pageControl.backgroundColor = [UIColor whiteColor];
    _pageControl.numberOfPages = _mageConunt;
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    _pageControl.frame = CGRectMake(0, 200, AppWidth, 25);
   [self insertSubview:_pageControl aboveSubview:self];
    
    //标题
    _titleLabel.frame = CGRectMake(leftPadding, maxY(_imageScrollView)+topPadding, width(self)-2*leftPadding, 40);
    
    
    _iconImageView.frame = CGRectMake(leftPadding, 15, 36, 36);

    _iconName.frame = CGRectMake(maxX(_iconImageView)+10, minY(_iconImageView)-8, 100, 50);
   
    _priceInfo.frame = CGRectMake(width(self)-80-leftPadding, 10, 80, 80);
    _iconViewNamePriceInfoView.frame = CGRectMake(0, maxY(_titleLabel)+topPadding, width(self), 70);
    
    _timeInfoLabel.frame = CGRectMake(leftPadding, maxY(_iconViewNamePriceInfoView)+topPadding, width(self), 50);
    _separateLine.frame = CGRectMake(25, maxY(_timeInfoLabel)+topPadding, AppWidth-50, 1);
   
    
    
    CGSize addressSize = [self sizeWithText:[NSString stringWithFormat:@"%@  ·  %@",_model.result.address,_model.result.title] maxSize:CGSizeMake(width(self)-67-padding, CGFLOAT_MAX) font:DESCFONT];
    _addressLabel.frame = CGRectMake(leftPadding, 0, width(self)-67-padding, addressSize.height);
    _addressLabel.font = DESCFONT;
    _mapBackImageView.frame = CGRectMake(maxX(_addressLabel)+padding/2, (addressSize.height-74)/2, 67, 74);
    _mapBackImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    _addressAndProviderView.frame = CGRectMake(0, maxY(_separateLine)+topPadding, width(self), addressSize.height);
    
    
    
        _actionXQLabel.frame = CGRectMake(0, 0, 80, 30);
    _actionXQLabel.center = CGPointMake(AppWidth/2, 15);
    _actionXQLabel.textAlignment=1;
    
     _dot1.frame = CGRectMake(minX(_actionXQLabel)-10, 13, 5, 5);
    
    
    _leftLine.frame = CGRectMake(minX(_dot1)-120, 15, 110, 1);
   

    _dot2.frame = CGRectMake(maxX(_actionXQLabel)+10, 13, 5, 5);
    _rightLine.frame = CGRectMake(maxX(_dot2)+10, 15, 110, 2);
    
    
    _actionView.frame = CGRectMake(0, maxY(_addressAndProviderView)+50, width(self), 30);
    
    _descriptionLabel.frame = CGRectMake(0, maxY(_actionView)+topPadding, width(self), lastHight);
    
    _viewHeight = maxY(_descriptionLabel)+padding+45;
}


//-(void)tapGesAction:(UIGestureRecognizer*)gestureRecognizer//手势执行事件
//{
//    float newscale=0.2*1.5;
//    CGRect zoomRect = [self zoomRectForScale:newscale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
//    NSLog(@"zoomRect:%@",NSStringFromCGRect(zoomRect));
//    [ _imageScrollView zoomToRect:zoomRect animated:YES];//重新定义其cgrect的x和y值
//    //    [_scrollView setZoomScale:newscale animated:YES];//以原先中心为点向外扩
//}
//
//-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView//scrollview的delegate事件。需要设置缩放才会执行。
//{
//    return _imageView;
//}
//
//
//- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {//传入缩放比例和手势的点击的point返回<span style="color:#ff0000;">缩放</span>后的scrollview的大小和X、Y坐标点
//    
//    CGRect zoomRect;
//    
//    // the zoom rect is in the content view's coordinates.
//    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
//    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
//    zoomRect.size.height = [_imageScrollView frame].size.height / scale;
//    zoomRect.size.width  = [_imageScrollView frame].size.width  / scale;
//    
//    // choose an origin so as to get the right center.
//    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
//    //    zoomRect.origin.x=center.x;
//    //    zoomRect.origin.y=center.y;
//    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
//    
//    return zoomRect;
//}


- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}


-(void)scrollViewDidScroll:(UIScrollView *)sender{
    CGFloat width=sender.frame.size.width;
    if (fmodf(sender.contentOffset.x,width)==0) {
        NSInteger page= sender.contentOffset.x/width;
        _pageControl.currentPage=page;
    }
}
- (void)changePage:(id)sender
{
    NSInteger page = _pageControl.currentPage;
    
    
    
    // update the scroll view to the appropriate page
    CGRect frame = _imageScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [sender scrollRectToVisible:frame animated:YES];
}



@end
