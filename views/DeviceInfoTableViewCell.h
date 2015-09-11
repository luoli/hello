//
//  DeviceInfoTableViewCell.h
//  tapGuesture
//
//  Created by luolihacker on 15/7/31.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@property (weak, nonatomic) IBOutlet UILabel *URLLabel;

@property (weak, nonatomic) IBOutlet UILabel *accountNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *TokenLabel;

@end
