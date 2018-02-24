//
//  NSObject+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FoundationExtension)

#pragma mark - Associate value
/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 */
- (void)setAssociateValue:(nullable id)value withKey:(void *)key;

/**
 Associate one object to `self`, as if it was a weak property (week, nonatomic).
 */
- (void)setAssociateWeakValue:(nullable id)value withKey:(void *)key;

/**
 Get the associated value from `self`.
 */
- (nullable id)getAssociatedValueForKey:(void *)key;

/**
 Remove all associated values.
 */
- (void)removeAssociatedValues;

#pragma mark - Others
///=============================================================================
/// @name Others
///=============================================================================

/**
 Returns the class name in NSString.
 */
+ (NSString *)className;

/**
 Returns the class name in NSString.
 */
- (NSString *)className;

/**
 Returns a copy of the instance with `NSKeyedArchiver` and ``NSKeyedUnarchiver``.
 Returns nil if an error occurs.
 */
- (nullable id)deepCopy;

@end

NS_ASSUME_NONNULL_END


