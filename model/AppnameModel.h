//
//  AppnameModel.h
//  tapGuesture
//
//  Created by luolihacker on 15/8/5.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppnameModel : NSObject
@property(nonatomic,strong)NSString *appName;//应用的名字
@property(nonatomic,strong)NSString *appImgPath;//应用图片的路径

//获取appImgPath
+(NSString *)dogetAppImgPath:(NSString *)name andType:(NSString *)type;
@end
