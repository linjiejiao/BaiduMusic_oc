//
//  ArtistInfo.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "ArtistInfo.h"
#import "StringUtils.h"

const NSString *KEY_ARTIST_INFO_ID = @"artist_id";
const NSString *KEY_TING_UID = @"ting_uid";
const NSString *KEY_NAME = @"name";
const NSString *KEY_COUNTRY = @"country";
const NSString *KEY_ALBUMS_TOTAL = @"albums_total";
const NSString *KEY_SONGS_TOTAL = @"songs_total";
const NSString *KEY_AVATAR = @"avatar";
const NSString *KEY_AVATAR_SMALL = @"small";
const NSString *KEY_AVATAR_BIG = @"big";

@implementation ArtistInfo

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if(self){
        [self fillDetailsWithDictionary:dic];
    }
    return self;
}

- (void)fillDetailsWithDictionary:(NSDictionary *)dic {
    id value = [dic objectForKey:KEY_ARTIST_INFO_ID];
    if(value){
        self.artistId = [value intValue];
    }
    value = [dic objectForKey:KEY_TING_UID];
    if(value){
        self.tingUid = [value intValue];
    }
    value = [dic objectForKey:KEY_NAME];
    if(value && [value isKindOfClass:[NSString class]]){
        self.name = [StringUtils fixString:value];
    }
    value = [dic objectForKey:KEY_COUNTRY];
    if(value && [value isKindOfClass:[NSString class]]){
        self.country = [StringUtils fixString:value];
    }
    value = [dic objectForKey:KEY_ALBUMS_TOTAL];
    if(value && [value isKindOfClass:[NSString class]]){
        self.albumsTotal = value;
    }
    value = [dic objectForKey:KEY_SONGS_TOTAL];
    if(value && [value isKindOfClass:[NSString class]]){
        self.songsTotal = value;
    }
    {
        NSDictionary *avatar = [dic objectForKey:KEY_AVATAR];
        value = [avatar objectForKey:KEY_AVATAR_SMALL];
        if(value && [value isKindOfClass:[NSString class]]){
            self.avatarSmall = [StringUtils fixUrl:value];
        }
        value = [avatar objectForKey:KEY_AVATAR_BIG];
        if(value && [value isKindOfClass:[NSString class]]){
            self.avatarBig = [StringUtils fixUrl:value];
        }
    }
}

- (NSString *)description {
    return [StringUtils descriptionForObject:self showSuper:NO];
}

@end
