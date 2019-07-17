//
//  KLCollectionReusableView.m
//  KLCollectionView
//
//  Created by Kalan on 2019/7/15.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "KLCollectionReusableView.h"
#import "KLCollectionViewLayoutAttributes.h"

@implementation KLCollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    // 设置背景颜色
    KLCollectionViewLayoutAttributes *ecLayoutAttributes = (KLCollectionViewLayoutAttributes*)layoutAttributes;
    self.backgroundColor = ecLayoutAttributes.color;
}

@end
