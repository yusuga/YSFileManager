//
//  YSFileManager.h
//  YSFileManagerExample
//
//  Created by Yu Sugawara on 2014/02/10.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSFileManager : NSObject

/* Documents */
+ (NSString*)documentDirectory;
+ (NSString*)documentDirectoryWithAppendingPathComponent:(NSString*)path;
+ (NSString*)documentDirectoryWithAppendingPathComponent:(NSString*)path create:(BOOL)shouldCreate;

/* tmp */
+ (NSString*)temporaryDirectory;
+ (NSString*)temporaryDirectoryWithAppendingPathComponent:(NSString*)path;
+ (NSString*)temporaryDirectoryWithAppendingPathComponent:(NSString*)path create:(BOOL)shouldCreate;

/* Library/Caches */
+ (NSString*)cachesDirectory;
+ (NSString*)cachesDirectoryWithAppendingPathComponent:(NSString*)path;
+ (NSString*)cachesDirectoryWithAppendingPathComponent:(NSString*)path create:(BOOL)shouldCreate;;

/* pathのディレクトリを作成 */
+ (BOOL)createDirectoryAtPath:(NSString*)path;

/* pathのファイルまたはディレクトリを削除 */
+ (BOOL)removeAtPath:(NSString*)path;

/* pathのファイルが存在しているか */
+ (BOOL)fileExistsAtPath:(NSString*)path;

/* pathのファイルがelapsedTimeを超えているか */
+ (BOOL)isElapsedFileModificationDateWithPath:(NSString*)path elapsedTimeInterval:(NSTimeInterval)elapsedTime;

/* directoryPath内の全てのファイル名 */
+ (NSArray*)fileNamesAtDirectoryPath:(NSString *)directoryPath;

/* directoryPath内のextension(拡張子)と一致する全てのファイル名 */
+ (NSArray*)fileNamesAtDirectoryPath:(NSString*)directoryPath extension:(NSString*)extension;


@end