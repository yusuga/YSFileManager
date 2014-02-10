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

/* tmp */
+ (NSString*)temporaryDirectory;
+ (NSString*)temporaryDirectoryWithAppendingPathComponent:(NSString*)path;

/* Library/Caches */
+ (NSString*)cachesDirectory;
+ (NSString*)cachesDirectoryWithAppendingPathComponent:(NSString*)path;

/* ディレクトリの作成 */
+ (BOOL)createDirectoryAtPath:(NSString*)path;

/* pathのファイルが存在しているか */
+ (BOOL)fileExistsAtPath:(NSString*)path;

/* pathのファイルがelapsedTimeを超えているか */
+ (BOOL)isElapsedFileModificationDateWithPath:(NSString*)path elapsedTimeInterval:(NSTimeInterval)elapsedTime;

/* directoryPath内の全てのファイル名 */
+ (NSArray*)fileNamesAtDirectoryPath:(NSString *)directoryPath;

/* directoryPath内のextension(拡張子)と一致する全てのファイル名 */
+ (NSArray*)fileNamesAtDirectoryPath:(NSString*)directoryPath extension:(NSString*)extension;

/* pathのファイルを削除 */
+ (BOOL)removeFilePath:(NSString*)path;

@end