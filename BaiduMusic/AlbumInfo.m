//
//  AlbumInfo.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "AlbumInfo.h"
#import "StringUtils.h"

const NSString *KEY_ALBUM_INFO_ID = @"album_id";
const NSString *KEY_ALBUM_INFO_TITLE = @"title";
const NSString *KEY_PIC_SMALL = @"pic_small";
const NSString *KEY_PIC_BIG = @"pic_big";
const NSString *KEY_PUBLISH_TIME = @"publishtime";
const NSString *KEY_PUBLISH_COMPANY = @"publishcompany";

@implementation AlbumInfo

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if(self){
        [self fillDetailsWithDictionary:dic];
    }
    return self;
}

- (void)fillDetailsWithDictionary:(NSDictionary *)dic {
    id value = [dic objectForKey:KEY_ALBUM_INFO_ID];
    if(value){
        self.albumId = [value intValue];
    }
    value = [dic objectForKey:KEY_ALBUM_INFO_TITLE];
    if(value && [value isKindOfClass:[NSString class]]){
        self.title = [StringUtils fixString:value];
    }
    value = [dic objectForKey:KEY_PIC_SMALL];
    if(value && [value isKindOfClass:[NSString class]]){
        self.picSmall = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_PIC_BIG];
    if(value && [value isKindOfClass:[NSString class]]){
        self.picBig = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_PUBLISH_TIME];
    if(value && [value isKindOfClass:[NSString class]]){
        self.publishTime = [StringUtils fixString:value];
    }
    value = [dic objectForKey:KEY_PUBLISH_COMPANY];
    if(value && [value isKindOfClass:[NSString class]]){
        self.publishCompany = [StringUtils fixString:value];
    }
}

- (NSString *)description {
    return [StringUtils descriptionForObject:self showSuper:NO];
}

@end
