//
//  ViewController.h
//  tapGuesture
//
//  Created by luolihacker on 15/7/28.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@end

