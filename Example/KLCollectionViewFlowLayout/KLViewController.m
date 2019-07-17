//
//  KLViewController.m
//  KLCollectionViewFlowLayout
//
//  Created by 574068650@qq.com on 07/17/2019.
//  Copyright (c) 2019 574068650@qq.com. All rights reserved.
//

#import "KLViewController.h"
#import "KLCollectionViewVerticalLayout.h"
#import <Masonry/Masonry.h>

@interface KLViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, KLCollectionViewBaseFlowLayoutDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeCustom];
    change.backgroundColor = UIColor.blackColor;
    [self.view addSubview:change];
    [change mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(40);
    }];
    [change addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)changeColor {
    [self.collectionView reloadData];
}

// MARK: - UICollectionViewDelegate UICollectionViewDataSource UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 14;
        case 2: return 30;
        default: return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class) forIndexPath:indexPath];
    cell.layer.borderWidth = 1;
    
    return cell;
}

// MARK: - KLCollectionViewBaseFlowLayoutDelegate
- (KLLayoutType)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout typeOfLayout:(NSInteger)section {
    
    switch (section) {
        case 1:     // 填充式布局
            return FillLayout;
        case 2:     // 标签布局
            return LabelHorizontalLayout;
        default:    // 百分比布局
            return PercentLayout;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout percentOfRow:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                    return 1 / 4.0;
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                    return 1 / 4.0;
                default:
                    return 1 / 2.0;
            }
        }
        default:
            return 1 / 3.0;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 1: {
            switch (indexPath.row) {
                case 0: return CGSizeMake((collectionView.bounds.size.width - 20) * 0.45, 300);
                default: return CGSizeMake((collectionView.bounds.size.width - 20) * 0.55, 100);
            }
        }
            
        case 2: return CGSizeMake(40 + arc4random_uniform(200), 40);
            
        default:
            break;
    }
    
    return CGSizeMake(0, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout backColorForSection:(NSInteger)section {
    return [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 2) {
        return 10;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 2) {
        return 10;
    }
    return 0;
}

// MARK: - Getter
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        KLCollectionViewVerticalLayout *layout = KLCollectionViewVerticalLayout.alloc.init;
        layout.canDrag = NO;
        layout.header_suspension = NO;
        layout.delegate = self;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
    }
    return _collectionView;
}

@end
