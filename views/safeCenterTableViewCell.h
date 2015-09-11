//
//  safeCenterTableViewCell.h
//  tapGuesture
//
//  Created by luolihacker on 15/7/31.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface safeCenterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *breakOutLabel;

@property (weak, nonatomic) IBOutlet UILabel *numOfVirusLabel;

@property (weak, nonatomic) IBOutlet UILabel *numOfBugLabel;

@property (weak, nonatomic) IBOutlet UILabel *numOfAppOutlineLabel;


@property (weak, nonatomic) IBOutlet UIButton *safeCheckBtn;

- (IBAction)safetyCheck;
@end
