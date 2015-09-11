//
//  ViewController.m
//  tapGuesture
//
//  Created by luolihacker on 15/7/28.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "ViewController.h"
#import "DrawerView.h"
#import "segementTableViewCell.h"
#import "DeviceInfoTableViewCell.h"
#import "safeCenterTableViewCell.h"
#import "DBManage.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.frame = CGRectMake(0, 25, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    [self UIConfig];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    DrawerView *testView = [[DrawerView alloc]initView:contentView parentView:self.view];
    [self.view addSubview:testView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//配置UI
-(void)UIConfig
{

    UILabel *title = [[UILabel alloc]initWithFrame:self.view.bounds];
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"贝安移动安全管理系统";
    title.font = [UIFont fontWithName:@"Helvetica-Bold"  size:14];
    
   // 创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    [[UINavigationBar appearance]setBarTintColor:UIColorFromRGB(0x4682B4)];
    navBar.translucent = YES;
    
   //创建一个导航栏集合
    UINavigationItem *navItem = [[UINavigationItem alloc]init];
    navItem.titleView = title;
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:nil];
    [navBar pushNavigationItem:navItem animated:NO];
    [navItem setLeftBarButtonItem:leftBtn];
    [navItem setRightBarButtonItem:rightBtn];
    [self.view addSubview:navBar];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *idens = @"idens";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idens];
    if (cell == nil) {
        switch (indexPath.row) {
            case 0:{
                
                cell = [[NSBundle mainBundle]loadNibNamed:@"segementTableViewCell" owner:nil options:nil].lastObject;
                
            }
                break;
                
            case 1:{
                
                cell = [[NSBundle mainBundle]loadNibNamed:@"DeviceInfoTableViewCell" owner:nil options:nil].lastObject;
                
            }
                break;
            case 2:{
                
                cell = [[NSBundle mainBundle]loadNibNamed:@"safeCenterTableViewCell" owner:nil options:nil].lastObject;
                safeCenterTableViewCell *scell = (safeCenterTableViewCell *)cell;
                scell.safeCheckBtn.layer.borderWidth = 1.0;
                
            }
                break;
                
            default:
                break;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 100;
            break;
        case 1:
            return 200;
            break;
        case 2:
            return 200;
        default:
            break;
    }
    return 45;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
