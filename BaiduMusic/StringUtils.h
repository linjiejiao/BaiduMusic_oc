//
//  StringUtils.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

+ (NSString *)fixString:(NSString *)string;
+ (NSString *)fixUrl:(NSString *)string;
+ (NSString *)descriptionForObject:(NSObject *)object showSuper:(BOOL)showSuper;

@end
