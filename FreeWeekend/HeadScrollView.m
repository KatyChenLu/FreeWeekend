//
//  HeadScrollView.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "HeadScrollView.h"
#import <UIImageView+WebCache.h>

@interface HeadScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageView;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation HeadScrollView

+ (instancetype)headScrollViewWithImages:(NSArray *)imageArray {
    
    HeadScrollView *headScrollView = [[self alloc] init];
    headScrollView.imageArray = imageArray;
    
    return headScrollView;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;//?
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.pageView = [[UIPageControl alloc]init];
//    self.pageView.hidesForSinglePage = YES;//?
    
    self.pageView.frame = CGRectMake(0, self.bounds.size.height-25, AppWidth, 25);
    
    [self.superview insertSubview:self.pageView aboveSubview:self];
    
    NSInteger imageNum = self.imageArray.count;
    int i = 0;
    for (NSString *urlStr in self.imageArray) {
        NSURL *url = [NSURL URLWithString:urlStr];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_image"]];
        
        imageView.frame = CGRectMake(i*self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
        [self insertSubview:imageView atIndex:i];
        i++;
    }
    //自定义导航
    self.naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width*imageNum, self.bounds.size.height)];
    self.naviView.backgroundColor = [UIColor whiteColor];
    self.naviView.alpha = 0.0;
    [self.superview insertSubview:self.naviView aboveSubview:self.pageView];
    
    self.pageView.numberOfPages = imageNum;
    self.contentSize = CGSizeMake(imageNum*self.bounds.size.width, 0);
 
}

#pragma mark - ScrollViewDelegate
//监听scrollView滚动，改变pageView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.pageView.currentPage = offsetX / self.bounds.size.width;
}





@end
