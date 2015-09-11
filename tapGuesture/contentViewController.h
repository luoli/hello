//
//  contentViewController.h
//  tapGuesture
//
//  Created by luolihacker on 15/8/3.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentViewController : UIViewController<UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@end
