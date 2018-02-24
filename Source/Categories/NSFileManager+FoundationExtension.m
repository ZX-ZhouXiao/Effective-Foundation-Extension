//
//  NSFileManager+FoundationExtension.m
//  Foundation
//
//  Created by Shayen on 2018/2/24.
//  Copyright © 2018年 Avocado Technologies. All rights reserved.
//

#import "NSFileManager+FoundationExtension.h"

@implementation NSFileManager (FoundationExtension)

- (NSURL *)documentsURL {
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)cachesURL {
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSCachesDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)cachesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)libraryURL {
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSLibraryDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)libraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

- (double)sizeOfDirectoryAtPath:(NSString *)filePath {
    return [self sizeOfDirectoryAtPath:filePath error:nil];
}

- (double)sizeOfDirectoryAtPath:(NSString *)filePath error:(NSError **)error {
    double size = 0.0;
    for (NSString *fpath in [self fullPathContentsOfDirectoryAtPath:filePath error:error]) {
        size += [[self attribute:NSFileSize ofItemAtPath:fpath] doubleValue];
    }
    return size;
}

- (id)attribute:(NSString *)attributeName ofItemAtPath:(NSString *)filePath {
    NSError *error = nil;
    NSDictionary *attributes = [self attributesOfItemAtPath:filePath error:&error];
    if (nil != error) {
        NSLog(@"%s item == %@, error == %@", __PRETTY_FUNCTION__, [filePath lastPathComponent], error);
    }
    return [attributes objectForKey:attributeName];
}

- (NSArray *)fullPathContentsOfDirectoryAtPath:(NSString *)path error:(NSError **)error {
    NSArray *contents = [self contentsOfDirectoryAtPath:path error:error];
    NSMutableArray *contentsWithFullPath = [NSMutableArray array];
    for (NSString *fileName in contents) {
        [contentsWithFullPath addObject:[path stringByAppendingPathComponent:fileName]];
    }
    return contentsWithFullPath;
}

@end
