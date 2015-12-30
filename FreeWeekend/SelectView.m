//
//  SelectView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "SelectView.h"
#import "SelectButton.h"
@interface SelectView (){
    SelectButton *_detailButton;
    
    SelectButton *_tipButton;
    UIView *_slideLinkView;
     BOOL _returnLeft;
}



@property (nonatomic, strong) SelectButton *selectingButton;


@end


@implementation SelectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setSth];
    }
    return  self;
}
- (void)awakeFromNib {
    [self setSth];
}

- (void)setSth {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    _detailButton = [SelectButton buttonWithType:UIButtonTypeSystem];
    [self addButton:_detailButton image:[[UIImage imageNamed:@"king"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    [_detailButton addTarget:self action:@selector(touchesButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _tipButton = [SelectButton buttonWithType:UIButtonTypeSystem];
    [self addButton:_tipButton image:[[UIImage imageNamed:@"bell"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:1];
    [_tipButton addTarget:self action:@selector(touchesButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _slideLinkView = [UIView new];
    _slideLinkView.backgroundColor = [UIColor grayColor];;
    _slideLinkView.layer.masksToBounds = NO;
    _slideLinkView.layer.cornerRadius = 3;
    [self addSubview:_slideLinkView];

    
}
- (void)addButton:(SelectButton *)btn image:(UIImage *)image tag:(NSInteger)tag {
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setImage:image forState:UIControlStateNormal];
    btn.tag = tag;
    [self addSubview:btn];
}

//+ (instancetype)selectViewWith


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat viewH = self.bounds.size.height;
    CGFloat viewW = self.bounds.size.width;
    CGFloat btnW = viewW * 0.3;
    CGFloat btnH = viewH;
    //计算间距
    CGFloat margin = (viewW - btnW * (self.subviews.count - 1)) / self.subviews.count;
    
    _detailButton.frame = CGRectMake(margin, 0, btnW, btnH);
    _tipButton.frame = CGRectMake(2 * margin + btnW , 0, btnW, btnH);
    _slideLinkView.frame = CGRectMake(margin, viewH - 4, btnW, 2);
    
    
}

- (void)touchesButton:(SelectButton *)button {
  
    if (_selectingButton == button) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(selecteView:didSelectedButtonFrom:to:)]) {
        
        [self.delegate selecteView:self didSelectedButtonFrom:_selectingButton.tag to:button.tag];
        
    }
   
    CGRect rect = _slideLinkView.frame;
//    if (_slideLinkView.frame.origin.x > button.frame.origin.x) {
//        linkRect1.origin.x = button.frame.origin.x;
//        _returnLeft = YES;
//    }else if (_slideLinkView.frame.origin.x > button.frame.origin.x){
//        linkRect1.origin.x = button.frame.origin.x;
//        _returnLeft = NO;
//    }
    rect.origin.x = button.frame.origin.x;
    [UIView animateWithDuration:0.3 animations:^{
        _slideLinkView.frame = rect;
    }];
    
    
    
//    CGRect linkRect2 = _slideLinkView.frame;
//    linkRect2.origin.x = button.frame.origin.x;
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        _slideLinkView.frame = linkRect1;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 animations:^{
//            _slideLinkView.frame = linkRect2;
//        }];
//        
//    }];
    //设置当前
    _selectingButton = button;
    
}

-(void)setDelegate:(id<SelectViewDelegate>)delegate {
    _delegate = delegate;
    [self touchesButton:_detailButton];
    
}
- (void)linkToIndex:(NSInteger)index {
    
    switch (index) {
        case 1:
            if ([self.delegate respondsToSelector:@selector(selecteView:didChangeSelectedView:)]) {
                [self.delegate selecteView:self didChangeSelectedView:1];
            }
            _selectingButton = _detailButton;
            break;
            case 2:
            if ([self.delegate respondsToSelector:@selector(selecteView:didChangeSelectedView:)]) {
                [self.delegate selecteView:self didChangeSelectedView:2];
            }
            _selectingButton = _tipButton;
            break;
            
            
        default:
            break;
    }
    
//    [self changeFrame];
//    CGRect linkRect1 = _slideLinkView.frame;
//    if (_slideLinkView.frame.origin.x > _selectingButton.frame.origin.x) {
//        linkRect1.origin.x = _selectingButton.frame.origin.x;
//        _returnLeft = YES;
//    }else if (_slideLinkView.frame.origin.x > _selectingButton.frame.origin.x){
//        linkRect1.origin.x = _selectingButton.frame.origin.x;
//        _returnLeft = NO;
//    }
//    
//    
//    CGRect linkRect2 = _slideLinkView.frame;
//    linkRect2.origin.x = _selectingButton.frame.origin.x;
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        _slideLinkView.frame = linkRect1;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 animations:^{
//            _slideLinkView.frame = linkRect2;
//        }];
//        
//    }];
    CGRect rect = _slideLinkView.frame;
    rect.origin.x = _selectingButton.frame.origin.x;
    [UIView animateWithDuration:0.3 animations:^{
        _slideLinkView.frame = rect;
    }];
    
}


@end
