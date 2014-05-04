//
//  ViewController.m
//  YSFileManagerExample
//
//  Created by Yu Sugawara on 2014/02/10.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "YSFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = @"dir1/text.text";
    NSString *fullPath = [YSFileManager documentDirectoryWithAppendingPathComponent:path create:YES];
    NSLog(@"document full path = %@", fullPath);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
