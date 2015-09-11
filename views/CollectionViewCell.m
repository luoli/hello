//
//  CollectionViewCell.m
//  tapGuesture
//
//  Created by luolihacker on 15/7/31.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame)-20)];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.nameOfAppLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.nameOfAppLabel.backgroundColor = [UIColor clearColor];
        self.nameOfAppLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.nameOfAppLabel];
        
    }
    return self;
}
@end
