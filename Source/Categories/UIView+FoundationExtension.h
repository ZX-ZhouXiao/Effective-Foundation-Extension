//
//  UIView+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FoundationExtension)

/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)snapshotImage;

/**
 Remove all subviews.
 */
- (void)removeAllSubviews;

/**
 Init View from nib file
 */
-(_Nullable id)initWithFrame:(CGRect)frame nibNameOrNil:(NSString *_Nonnull)nibNameOrNil;


@property (nullable, nonatomic, readonly) UIViewController *viewController;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

@end

NS_ASSUME_NONNULL_END


