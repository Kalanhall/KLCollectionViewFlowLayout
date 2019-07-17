//
//  KLCollectionViewLayoutAttributes.m
//  KLCollectionView
//
//  Created by Kalan on 2019/7/15.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "KLCollectionViewLayoutAttributes.h"
#import "KLCollectionReusableView.h"

@implementation KLCollectionViewLayoutAttributes

+ (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath {
    KLCollectionViewLayoutAttributes *layoutAttributes = [super layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    return layoutAttributes;
}

@end
