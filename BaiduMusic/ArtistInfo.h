//
//  ArtistInfo.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistInfo : NSObject
@property (assign, nonatomic) int artistId;
@property (assign, nonatomic) int tingUid;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *albumsTotal;
@property (copy, nonatomic) NSString *songsTotal;
@property (copy, nonatomic) NSString *avatarSmall;
@property (copy, nonatomic) NSString *avatarBig;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
