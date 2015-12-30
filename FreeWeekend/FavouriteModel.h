//
//  FavouriteModel.h
//  FreeWeekend
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface FavouriteModel : JSONModel

@property (nonatomic, copy)NSString *time_info;
@property (nonatomic, copy)NSString *front_cover_image_list;
@property (nonatomic, copy)NSString *leo_id;
//@property (nonatomic, copy)NSString *images;
@property (nonatomic, copy)NSString *title;

@end
