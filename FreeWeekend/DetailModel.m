//
//  DetailModel.m
//  FreeWeekend
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 陈璐. All rights reserved.
//

#import "DetailModel.h"

@implementation DtimeModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DDescription
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DSkuRepresent
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DLrzmTips
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DCategoryModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation BookingPolicy
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end


@implementation DResultModel

+ (JSONKeyMapper *)keyMapper {
    return  [[JSONKeyMapper alloc]initWithDictionary:@{@"sku_representation.represent_data":@"representdata",@"description":@"Ddescription"}];
}
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation DetailModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
