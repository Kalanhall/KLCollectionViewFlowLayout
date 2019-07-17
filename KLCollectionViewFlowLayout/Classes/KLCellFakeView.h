//
//  KLCellFakeView.h
//  KLCollectionView
//
//  Created by Kalan on 2019/7/15.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLCellFakeView : UIView

@property (nonatomic,   weak) UICollectionViewCell *cell;
@property (nonatomic, strong) UIImageView *cellFakeImageView;
@property (nonatomic, strong) UIImageView *cellFakeHightedView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CGPoint originalCenter;
@property (nonatomic, assign) CGRect cellFrame;

- (instancetype)initWithCell:(UICollectionViewCell *)cell;
- (void)changeBoundsIfNeeded:(CGRect)bounds;
- (void)pushFowardView;
- (void)pushBackView:(void(^)(void))completion;

@end
