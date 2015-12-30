//
//  DetailModel.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <JSONModel/JSONModel.h>

/*
 http://api.lanrenzhoumo.com/wh/common/leo_detail?leo_id=1350134005&session_id=000040fbe8f4242bdbb2808145bda7aa8e6106&v=2
 */

@protocol DResultModel
@end
@protocol BookingPolicy
@end
@protocol DLrzmTips
@end
@protocol DSkuRepresent
@end
@protocol DDescription
@end
@protocol DtimeModel
@end

@interface DtimeModel : JSONModel
@property (nonatomic, copy)NSString *info;
@property (nonatomic, copy)NSString *strart;
@property (nonatomic, copy)NSString *end;
@end

@interface DDescription : JSONModel
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *type;
@end

@interface  DSkuRepresent : JSONModel
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *price;
@end

@interface DLrzmTips : JSONModel
@property (nonatomic, copy)NSString *content;
@end

@interface DCategoryModel : JSONModel
@property (nonatomic, copy)NSString *icon_view;
@property (nonatomic, copy)NSString *cn_name;
@end

@interface BookingPolicy : JSONModel
@property (nonatomic, copy)NSString *content;
@end

@interface DResultModel : JSONModel
@property (nonatomic, copy)NSString *leo_target_id;
@property (nonatomic, strong)NSMutableArray <BookingPolicy>*booking_policy;
@property (nonatomic, copy)NSString *collected_num;
@property (nonatomic, copy)NSString *participate_status;
@property (nonatomic, strong)NSMutableArray *images;
@property (nonatomic, copy)NSString *viewed_num;
@property (nonatomic, strong)DCategoryModel *category;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)NSMutableArray <DLrzmTips>*lrzm_tips;
@property (nonatomic, strong)NSMutableArray <DSkuRepresent>*representdata;
@property (nonatomic, strong)NSMutableArray <DDescription>*Ddescription;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, strong)DtimeModel *time;
@property (nonatomic, copy)NSString *price_info;

@end

@interface DetailModel : JSONModel
@property (nonatomic, strong)DResultModel *result;
@end
