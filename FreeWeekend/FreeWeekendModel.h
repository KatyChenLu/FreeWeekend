//
//  FreeWeekendModel.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/14.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <JSONModel/JSONModel.h>

/*
 http://api.lanrenzhoumo.com/main/recommend/index/?city_id=0&lat=34.7718&lon=113.6726&page=1&session_id=0000420e5a44e8cda0ec934a0d840175ab34b6&v=3
 */


@interface AppendInfoModel : JSONModel
@end

@protocol ResultModel
@end

@interface ResultModel : JSONModel

@property (nonatomic, copy)NSString *biz_phone;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *show_free;
@property (nonatomic, copy)NSString *want_status;
@property (nonatomic, copy)NSString *poi;
@property (nonatomic, copy)NSString *category;
@property (nonatomic, copy)NSString *collected_num;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *leo_id;
@property (nonatomic, copy)NSString *sell_status;

@property (nonatomic, strong)NSArray *front_cover_image_list;

@property (nonatomic, copy)NSString *viewed_num;
@property (nonatomic, copy)NSString *consult_phone;
@property (nonatomic, copy)NSString *jump_type;
@property (nonatomic, strong)NSArray *tags;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *time_info;
@property (nonatomic, copy)NSString *time_desc;
@property (nonatomic, copy)NSString *jump_data;
@property (nonatomic, copy)NSString *distance;
@property (nonatomic, copy)NSString *item_type;
@property (nonatomic, copy)NSString *price_info;
@property (nonatomic, copy)NSString *category_id;
@property (nonatomic, copy)NSString *poi_name;


@end


@interface FreeWeekendModel : JSONModel

@property (nonatomic, copy)NSString *status;
@property (nonatomic, strong)AppendInfoModel *append_info;
@property (nonatomic, copy)NSString *page_total;
@property (nonatomic, copy)NSString *pagenumber;
@property (nonatomic, strong)NSMutableArray <ResultModel>* result;
@property (nonatomic, copy)NSString *msg;
@property (nonatomic, copy)NSString *result_count;

@end
