//
//  segementTableViewCell.h
//  tapGuesture
//
//  Created by luolihacker on 15/7/30.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface segementTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;



- (IBAction)viewBtn1;

- (IBAction)viewBtn2;

- (IBAction)viewBtn3;

@property (weak, nonatomic) IBOutlet UILabel *appNum;

@property (weak, nonatomic) IBOutlet UILabel *psNum;

@property (weak, nonatomic) IBOutlet UILabel *msgNum;

@end
