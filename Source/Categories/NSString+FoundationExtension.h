//
//  NSString+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FoundationExtension)
- (BOOL)isNull;
- (BOOL)isEmpty;
- (BOOL)isEmail;
- (BOOL)isMobile;
- (BOOL)isContainsEmoji;
- (BOOL)contains:(NSString *)string;

/**
 Return the height of fixed string
 **/
+ (CGRect)heightForString:(NSString *)str size:(CGSize)size font:(UIFont *)font;

/**
 NSString md5 decode and encode
 **/
+(NSString*)stringDecodingByMD5:(NSString*)str;
-(NSString*)md5DecodingString;
-(NSString*)md5StringFor16;

/**
 Formatter Amount
 
 @return ￥123,456,789.00
 */
- (NSString *)formatterAmount;

/**
 Formatter Number
 
 @return 123,456,789.00
 */
- (NSString *)formatterNumber;

- (NSString *)deleteFloatAllZero;

/**
 Trim blank characters (space and newline) in head and tail.
 */
- (NSString *)stringByTrim;


@end

NS_ASSUME_NONNULL_END

