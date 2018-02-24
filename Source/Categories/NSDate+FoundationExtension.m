//
//  NSDate+FoundationExtension.m
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import "NSDate+FoundationExtension.h"

static NSString *kNSDateHelperFormatSQLDateWithTime = @"yyyy-MM-dd HH:mm:ss";

@implementation NSDate (FoundationExtension)

static NSCalendar *_calendar = nil;
static NSDateFormatter *_displayFormatter = nil;

+ (void)initializeStatics {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            if (_calendar == nil) {
#if __has_feature(objc_arc)
                _calendar = [NSCalendar currentCalendar];
#else
                _calendar = [[NSCalendar currentCalendar] retain];
#endif
            }
            if (_displayFormatter == nil) {
                _displayFormatter = [[NSDateFormatter alloc] init];
            }
        }
    });
}

+ (NSCalendar *)sharedCalendar {
    [self initializeStatics];
    return _calendar;
}

+ (NSDateFormatter *)sharedDateFormatter {
    [self initializeStatics];
    return _displayFormatter;
}


+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    return [date string];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:kNSDateHelperFormatSQLDateWithTime];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

#pragma mark - Decomposing Dates

- (NSUInteger)hour {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitHour) fromDate:self];
    return [weekdayComponents hour];
}

- (NSUInteger)minute {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:self];
    return [weekdayComponents minute];
}

- (NSUInteger)year {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
    return [weekdayComponents year];
}
- (NSUInteger)month {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return [weekdayComponents month];
}

- (NSUInteger)day {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return [weekdayComponents day];
}
- (NSUInteger)second {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:self];
    return [weekdayComponents second];
}
- (NSUInteger)weekday {
    NSDateComponents *weekdayComponents = [[[self class] sharedCalendar] components:(NSCalendarUnitWeekday) fromDate:self];
    return [weekdayComponents weekday];
}

- (NSUInteger)weekNumber {
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitWeekOfMonth) fromDate:self];
    return [dateComponents weekOfMonth];
}

- (NSString *)stringWithFormat:(NSString *)format {
    [[self class] initializeStatics];
    [[[self class] sharedDateFormatter] setDateFormat:format];
    NSString *timestamp_str = [[[self class] sharedDateFormatter] stringFromDate:self];
    return timestamp_str;
}

- (NSString *)string {
    return [self stringWithFormat:kNSDateHelperFormatSQLDateWithTime];
}

// Formatter
+ (NSString *)getDateFromTimesTamp:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampWithoutSecond:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampOnlyDate:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampInChinese:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampOnlyTimeInChinese:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampOnlyDateInChinese:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampSimple:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)getDateFromTimesTampLongSimple:(NSString *)timesTamp {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timesTamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

@end

