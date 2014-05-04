//
//  YSFileManagerExampleTests.m
//  YSFileManagerExampleTests
//
//  Created by Yu Sugawara on 2014/02/10.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YSFileManager.h"

@interface YSFileManagerExampleTests : XCTestCase

@end

@implementation YSFileManagerExampleTests

- (void)setUp
{
    [super setUp];
    
    for (NSString *path in @[[YSFileManager documentDirectory],
                             [YSFileManager temporaryDirectory],
                             [YSFileManager cachesDirectory]])
    {
        for (NSString *fileName in [YSFileManager fileNamesAtDirectoryPath:path]) {
            [YSFileManager removeAtPath:[path stringByAppendingPathComponent:fileName]];
        }
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreateDirectory
{
    NSString *appendPath = [NSString stringWithFormat:@"%@/%@/%@", @(arc4random_uniform(10)), @(arc4random_uniform(10)), @(arc4random_uniform(10))];;
    NSString *fullPath = [YSFileManager documentDirectoryWithAppendingPathComponent:appendPath create:YES];
    NSLog(@"document: %@", fullPath);
    XCTAssertTrue([YSFileManager fileExistsAtPath:fullPath], @"fullPath: %@", fullPath);
    
    fullPath = [YSFileManager temporaryDirectoryWithAppendingPathComponent:appendPath create:YES];
    NSLog(@"temporary: %@", fullPath);
    XCTAssertTrue([YSFileManager fileExistsAtPath:fullPath], @"fullPath: %@", fullPath);
    
    fullPath = [YSFileManager cachesDirectoryWithAppendingPathComponent:appendPath create:YES];
    NSLog(@"caches: %@", fullPath);
    XCTAssertTrue([YSFileManager fileExistsAtPath:fullPath], @"fullPath: %@", fullPath);
}

@end
