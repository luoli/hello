//
//  DrawerView.h
//  tapGuesture
//
//  Created by luolihacker on 15/7/28.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 0 : 20)
#define BackHeight      (IOS7==YES ? 0 : 15)

#define fNavBarHeigth (IOS7==YES ? 64 : 44)

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height-StatusBarHeight)
typedef enum
{
    DrawerViewStateUp = 0,
    DrawerViewStateDown
}DrawerViewState;

@interface DrawerView : UIView<UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIImageView *arrow;                   //箭头图片
    UICollectionView *collectionview;     //九宫格显示应用
    
    CGPoint upPoint;                      //抽屉拉出时的中心点
    CGPoint downPoint;                    //抽屉回缩时的中心点
    
    UIView *parentView;                   //抽屉所在的View
    UIView *contentView;                  //抽屉里显示的内容
    
    DrawerViewState stateOfDrower;        //抽屉当前的状态
    
}

@property (nonatomic,strong)  UICollectionView *collectionview;
@property (nonatomic,retain)  UIView *parentView;
@property (nonatomic,retain)  UIView *contentView;
@property (nonatomic)         DrawerViewState   stateOfDrower;


- (id)initView:(UIView *)contentview parentView:(UIView *)parentview;
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void)handleTap:(UITapGestureRecognizer *)recognizer;
- (void)transformArrow:(DrawerViewState)drawState;
@end
