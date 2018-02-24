//
//  NSFileManager+FoundationExtension.h
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (FoundationExtension)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

/**
 Returns size of directory contents at give path
 */
- (double)sizeOfDirectoryAtPath:(NSString *)filePath;
/**
 Returns size of directory contents at give path
 */
- (double)sizeOfDirectoryAtPath:(NSString *)filePath error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END

