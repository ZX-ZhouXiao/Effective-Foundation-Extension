//
//  NSString+FoundationExtension.m
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import "NSString+FoundationExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (FoundationExtension)

+(CGRect)heightForString:(NSString*)str size:(CGSize)size font:(UIFont*)font{
    return [NSString heightForString:str size:size font:font lines:0];
}

+(CGRect)heightForString:(NSString*)str size:(CGSize)size font:(UIFont*)font lines:(NSInteger)lines{
    if (str.isNull) {
        return CGRectMake(0, 0, 0, 0);
    }
    static UILabel *lbtext;
    if (lbtext==nil) {
        lbtext    = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    }else{
        lbtext.frame=CGRectMake(0, 0, size.width, size.height);
    }
    lbtext.font=font;
    lbtext.text=str;
    lbtext.numberOfLines=lines;
    CGRect rect= [lbtext textRectForBounds:lbtext.frame limitedToNumberOfLines:lines];
    if(rect.size.height<0)
        rect.size.height=0;
    if (rect.size.width<0) {
        rect.size.width=0;
    }
    return rect;
}


+ (NSString* )stringDecodingByMD5:(NSString*)str{
    const char * cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (BOOL)isNull {
    if(self == nil || [self isKindOfClass:[NSNull class]] || [self isEmpty]) {
        return YES;
    }
    return NO;
}

- (BOOL)isEmpty {
    return [[self trimWhitespace] isEqualToString:@""];
}

- (BOOL)isEmail {
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isMobile {
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|4[0-9]|7[0-9]|8[01235-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

- (BOOL)contains:(NSString *)string {
    if (string) {
        NSRange range = [self rangeOfString:string];
        return (range.location != NSNotFound);
    }else {
        return NO;
    }
}

- (NSString* )md5DecodingString{
    return [NSString stringDecodingByMD5:self];
}

-(NSString*)md5StringFor16{
    NSString *md5Str = [NSString stringDecodingByMD5:self];
    if (md5Str) {
        return [md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return nil;
}

- (NSString *)formatterAmount {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans_CN"];
    formatter.numberStyle = kCFNumberFormatterCurrencyAccountingStyle;
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:self.doubleValue]];
    return newAmount;
}

- (NSString *)formatterNumber {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:self.doubleValue]];
    return newAmount;
}

- (BOOL)isContainsEmoji {
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

- (NSString *)deleteFloatAllZero {
    NSArray * arrStr=[self componentsSeparatedByString:@"."];
    NSString *str=arrStr.firstObject;
    NSString *str1= @"";
    if (arrStr.count > 1) {
        str1=arrStr.lastObject;
        while ([str1 hasSuffix:@"0"]) {
            str1=[str1 substringToIndex:(str1.length-1)];
        }
    }
    return (str1.length>0)?[NSString stringWithFormat:@"%@.%@",str,str1]:str;
}

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}


#pragma mark -

- (NSString *)trimWhitespace {
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end

