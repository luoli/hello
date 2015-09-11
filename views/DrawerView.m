//
//  DrawerView.m
//  tapGuesture
//
//  Created by luolihacker on 15/7/28.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "DrawerView.h"
#import "CollectionViewCell.h"

@implementation DrawerView
@synthesize parentView,contentView,stateOfDrower,collectionview;

-(id)initView:(UIView *)contentview parentView:(UIView *)parentview
{
    self = [super initWithFrame:CGRectMake(0, 0, contentview.frame.size.width , parentview.frame.size.height+27)];
    if (self) {
        
        contentView = contentview;
        parentView = parentview;
        [parentView setUserInteractionEnabled:YES];
        
        //箭头的图片
        UIImage *drawer_arrow = [UIImage imageNamed:@"drawer_arrow.png"];

        arrow = [[UIImageView alloc]initWithImage:drawer_arrow];
        [arrow setFrame:CGRectMake(0, 0, 25, 25)];
        arrow.center = CGPointMake(contentView.frame.size.width/2, 0);
        [contentview addSubview:arrow];
        
        //嵌入内容的UIView
        [contentView setFrame:CGRectMake(0, 0, contentView.frame.size.width, contentView.bounds.size.height-40)];
        [self addSubview:contentView];
        
        //设置代理
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:flowLayout];
        self.collectionview.backgroundColor = [UIColor whiteColor];
        self.collectionview.delegate = self;
        self.collectionview.dataSource = self;
        self.collectionview.scrollEnabled = NO;
        [self.collectionview registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL_ID"];
        [self.contentView addSubview:self.collectionview];
                
        //移动的手势
        UIPanGestureRecognizer *panRecognize = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        panRecognize.delegate = self;
        [panRecognize setEnabled:YES];
        [panRecognize delaysTouchesEnded];
        [panRecognize cancelsTouchesInView];
        [self addGestureRecognizer:panRecognize];
        
        //单击的手势
        UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        tapRecognize.numberOfTouchesRequired = 1;
        tapRecognize.delegate = self;
        [tapRecognize setEnabled:YES];
        [tapRecognize delaysTouchesBegan];
        [tapRecognize cancelsTouchesInView];
        [self addGestureRecognizer:tapRecognize];
        
        //设置两个位置的坐标
        downPoint = CGPointMake(parentView.frame.size.width/2, parentView.frame.size.height + 240);
        upPoint = CGPointMake(parentview.frame.size.width/2, parentview.frame.size.height-contentview.frame.size.height/2+60);
        self.center =  downPoint;
        
        //设置起始状态
        stateOfDrower = DrawerViewStateDown;
        
    }
    return self;
}


//处理移动的手势
-(void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    CGPoint translation = [recognizer translationInView:parentView];
    NSLog(@"2*upPoint.y = %f",upPoint.y*2);
    NSLog(@"self.center.y = %f,translation = %f",self.center.y,translation.y);
    if (self.center.y + translation.y < upPoint.y) {
        self.center = upPoint;
    }else if(self.center.y + translation.y > downPoint.y)
    {
        self.center = downPoint;
    }else{
        self.center = CGPointMake(self.center.x,self.center.y + translation.y);
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:parentView];
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            if (downPoint.y - self.center.y > 50 && self.center.y > upPoint.y*1.5) {
                self.center = upPoint;
                [self transformArrow:DrawerViewStateUp];
            }else
            {
                self.center = downPoint;
                [self transformArrow:DrawerViewStateDown];
            }
            
        } completion:nil];
    }
}

//处理触摸的函数
-(void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        if (stateOfDrower == DrawerViewStateDown) {
            self.center = upPoint;
            [self transformArrow:DrawerViewStateUp];
        }else
        {
            self.center = downPoint;
            [self transformArrow:DrawerViewStateDown];
        }
    } completion:nil];

}

//改变箭头的方向
-(void)transformArrow:(DrawerViewState)drawState
{
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if (drawState == DrawerViewStateUp){
            arrow.transform = CGAffineTransformMakeRotation(M_PI);
        }else
        {
            arrow.transform = CGAffineTransformMakeRotation(0);
        }
    } completion:^(BOOL finish){
       stateOfDrower = drawState;
    }];
}

#pragma mark -- UICollectionViewDataSource
//定义展示UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

//定义展示的section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionViewCell展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL_ID" forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.imgView.image = [UIImage imageNamed:@"drawer_arrow"];
    cell.nameOfAppLabel.text = [NSString stringWithFormat:@"Cell %ld",indexPath.row];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionViewCell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(95, 95);
}

//每个UICollectionViewCell的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

//定义每个UICollectionView的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 125;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView 被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择%ld",indexPath.row);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
