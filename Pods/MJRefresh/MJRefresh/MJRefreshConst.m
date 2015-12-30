//  代码地址: https://github.com/CoderMJLee/MJRefresh
//  代码地址: http://code4app.com/ios/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E4%B8%8B%E6%8B%89%E4%B8%8A%E6%8B%89%E5%88%B7%E6%96%B0/52326ce26803fabc46000000
#import <UIKit/UIKit.h>



const CGFloat MJRefreshHeaderHeight = 54.0;
const CGFloat MJRefreshFooterHeight = 44.0;
const CGFloat MJRefreshFastAnimationDuration = 0.25;
const CGFloat MJRefreshSlowAnimationDuration = 0.4;

NSString *const MJRefreshKeyPathContentOffset = @"contentOffset";
NSString *const MJRefreshKeyPathContentInset = @"contentInset";
NSString *const MJRefreshKeyPathContentSize = @"contentSize";
NSString *const MJRefreshKeyPathPanState = @"state";

NSString *const MJRefreshHeaderLastUpdatedTimeKey = @"MJRefreshHeaderLastUpdatedTimeKey";

NSString *const MJRefreshHeaderIdleText = @"HOLD";

NSString *const MJRefreshHeaderPullingText = @"睁眼，因为你心为所动";
NSString *const MJRefreshHeaderRefreshingText =  @"闭目，难掩喜悦与期待";

NSString *const MJRefreshAutoFooterIdleText = @"HOLD";
NSString *const MJRefreshAutoFooterRefreshingText =  @"启程，只因追寻你所爱";
NSString *const MJRefreshAutoFooterNoMoreDataText =  @"一起走吧~";

NSString *const MJRefreshBackFooterIdleText = @"HOLD";
NSString *const MJRefreshBackFooterPullingText = @"睁眼，因为你心为所动";
NSString *const MJRefreshBackFooterRefreshingText = @"闭目，难掩喜悦与期待";
NSString *const MJRefreshBackFooterNoMoreDataText = @"请把我留在最好的时光里";