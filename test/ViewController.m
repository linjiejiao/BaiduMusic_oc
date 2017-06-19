//
//  ViewController.m
//  test
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMusic/BaiduMusic.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[BaiduMusicSearcher shareInstance] fullySearchWithKey:@"勇气" pageSize:10 pageNum:0 completion:^(BaiduMusicSearchResult *resut, NSError *error) {
        NSLog(@"resut=%@\nerror=%@", resut, error);
    }];
}

@end
