//
//  YSFileManager.m
//  YSFileManagerExample
//
//  Created by Yu Sugawara on 2014/02/10.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSFileManager.h"

@implementation YSFileManager

#pragma mark - document

+ (NSString*)documentDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    return [paths objectAtIndex:0];
}

+ (NSString*)documentDirectoryWithAppendingPathComponent:(NSString*)path
{
    return [[self documentDirectory] stringByAppendingPathComponent:path];
}

+ (NSString*)documentDirectoryWithAppendingPathComponent:(NSString*)path create:(BOOL)shouldCreate
{
    return [self directory:[self documentDirectoryWithAppendingPathComponent:path] create:shouldCreate];
}

#pragma mark - temporary

+ (NSString*)temporaryDirectory
{
    return NSTemporaryDirectory();
}

+ (NSString*)temporaryDirectoryWithAppendingPathComponent:(NSString*)path
{
    return [[self temporaryDirectory] stringByAppendingPathComponent:path];
}

+ (NSString *)temporaryDirectoryWithAppendingPathComponent:(NSString *)path create:(BOOL)shouldCreate
{
    return [self directory:[[self temporaryDirectory] stringByAppendingPathComponent:path] create:shouldCreate];
}

#pragma mark - caches

+ (NSString*)cachesDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    return [paths objectAtIndex:0];
}

+ (NSString*)cachesDirectoryWithAppendingPathComponent:(NSString*)path
{
    return [[self cachesDirectory] stringByAppendingPathComponent:path];
}

+ (NSString *)cachesDirectoryWithAppendingPathComponent:(NSString *)path create:(BOOL)shouldCreate
{
    return [self directory:[[self cachesDirectory] stringByAppendingPathComponent:path] create:shouldCreate];
}

#pragma mark -

+ (NSString*)directory:(NSString*)directory create:(BOOL)shouldCreate
{
    if (shouldCreate && ![self fileExistsAtPath:directory]) {
        [self createDirectoryAtPath:directory];
    }
    return directory;
}

#pragma mark -

+ (BOOL)createDirectoryAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;    
    BOOL created = [fileManager createDirectoryAtPath:path
                          withIntermediateDirectories:YES
                                           attributes:nil
                                                error:&error];
    return created;
}

+ (BOOL)removeAtPath:(NSString*)path
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    return [fileManager removeItemAtPath:path error:NULL];
}

+ (BOOL)fileExistsAtPath:(NSString*)path
{
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    /* ファイルが存在するか */
    if ([fileManager fileExistsAtPath:path]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isElapsedFileModificationDateWithPath:(NSString*)path elapsedTimeInterval:(NSTimeInterval)elapsedTime
{
    if ([self fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary* dicFileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
        if (error) {
            return NO;
        }
        /* 現在時間とファイルの最終更新日時との差を取得 */
        NSTimeInterval diff  = [[NSDate dateWithTimeIntervalSinceNow:0.0] timeIntervalSinceDate:dicFileAttributes.fileModificationDate];
        if(elapsedTime < diff){
            /* ファイルの最終更新日時からelapseTime以上経っている */
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}

+ (NSArray*)fileNamesAtDirectoryPath:(NSString *)directoryPath
{
    NSFileManager *fileManager=[[NSFileManager alloc] init];
    NSError *error = nil;
    /* 全てのファイル名 */
    NSArray *allFileName = [fileManager contentsOfDirectoryAtPath:directoryPath error:&error];
    if (error) {
        NSLog(@"Error: %s; error = %@;", __func__, error);
    }
    return allFileName;
}

+ (NSArray*)fileNamesAtDirectoryPath:(NSString*)directoryPath extension:(NSString*)extension
{
    NSArray *allFileName = [self fileNamesAtDirectoryPath:directoryPath];
    NSMutableArray *hitFileNames = [[NSMutableArray alloc] init];
    for (NSString *fileName in allFileName) {
        /* 拡張子が一致するか */
        if ([[fileName pathExtension] isEqualToString:extension]) {
            [hitFileNames addObject:fileName];
        }
    }
    return hitFileNames;
}

@end
