//
//  segementTableViewCell.m
//  tapGuesture
//
//  Created by luolihacker on 15/7/30.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "segementTableViewCell.h"

@implementation segementTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewBtn1:(UIControl *)sender {
        NSLog(@"%s%d", __func__, __LINE__);
}
- (IBAction)viewBtn {
    
        NSLog(@"%s%d", __func__, __LINE__);
}
- (IBAction)viewBtn1 {
    NSLog(@"%s%d", __func__, __LINE__);
}

- (IBAction)viewBtn2 {
        NSLog(@"%s%d", __func__, __LINE__);
    
}

- (IBAction)viewBtn3 {
        NSLog(@"%s%d", __func__, __LINE__);
}
@end
