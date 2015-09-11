//
//  AppnameModel.m
//  tapGuesture
//
//  Created by luolihacker on 15/8/5.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "AppnameModel.h"

@implementation AppnameModel
@synthesize appName,appImgPath;

+(NSString *)dogetAppImgPath:(NSString *)name andType:(NSString *)type
{
    AppnameModel *appname = [[AppnameModel alloc]init];
    appname.appImgPath = [[NSBundle mainBundle]pathForResource:name ofType:type];
    return appname.appImgPath;
}
@end
