//
//  UIScrollView+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (FoundationExtension)

- (void)scrollToTop;
- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToBottom;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeft;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRight;
- (void)scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

