//
//  NSData+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (FoundationExtension)

//+ (NSString*)now;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;

// Decomposing dates
- (NSUInteger)weekday;
- (NSUInteger)weekNumber;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;
- (NSUInteger)day;
- (NSUInteger)month;
- (NSUInteger)year;

// Formatter
/**
 解析时间戳: yyyy-MM-dd HH:mm:ss
 
 @param timesTamp yyyy-MM-dd HH:mm:ss
 @return Time String
 */
+ (NSString *)getDateFromTimesTamp:(NSString *)timesTamp;

/**
 解析时间戳: yyyy-MM-dd HH:mm
 
 @param timesTamp yyyy-MM-dd HH:mm
 @return Time String
 */
+ (NSString *)getDateFromTimesTampWithoutSecond:(NSString *)timesTamp;

/**
 解析时间戳: yyyy-MM-dd
 
 @param timesTamp yyyy-MM-dd
 @return Time String
 */
+ (NSString *)getDateFromTimesTampOnlyDate:(NSString *)timesTamp;

/**
 解析时间戳: yyyy年MM月dd日 HH:mm
 
 @param timesTamp yyyy年MM月dd日 HH:mm
 @return Time String
 */
+ (NSString *)getDateFromTimesTampInChinese:(NSString *)timesTamp;

/**
 解析时间戳: HH:mm
 
 @param timesTamp HH:mm
 @return Time String
 */
+ (NSString *)getDateFromTimesTampOnlyDateInChinese:(NSString *)timesTamp;

/**
 解析时间戳: yyyy年MM月dd日
 
 @param timesTamp yyyy年MM月dd日
 @return Time String
 */
+ (NSString *)getDateFromTimesTampOnlyTimeInChinese:(NSString *)timesTamp;

/**
 解析时间戳: dd/MM HH:mm
 
 @param timesTamp MM/dd HH:mm
 @return Time String
 */
+ (NSString *)getDateFromTimesTampSimple:(NSString *)timesTamp;

/**
 解析时间戳: yyyy/dd/MM HH:mm
 
 @param timesTamp yyyy/dd/MM HH:mm
 @return Time String
 */
+ (NSString *)getDateFromTimesTampLongSimple:(NSString *)timesTamp;


@end

NS_ASSUME_NONNULL_END


