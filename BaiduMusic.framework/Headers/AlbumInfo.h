//
//  AlbumInfo.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumInfo : NSObject
@property (assign, nonatomic) int albumId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *picSmall;
@property (copy, nonatomic) NSString *picBig;
@property (copy, nonatomic) NSString *publishTime;
@property (copy, nonatomic) NSString *publishCompany;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
