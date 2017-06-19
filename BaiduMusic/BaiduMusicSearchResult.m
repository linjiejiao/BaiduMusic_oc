//
//  BaiduMusicSearchResult.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "BaiduMusicSearchResult.h"
#import "StringUtils.h"

const NSString *KEY_QUERY = @"query";
const NSString *KEY_IS_ARTIST = @"is_artist";
const NSString *KEY_IS_ALBUM = @"is_album";
const NSString *KEY_RS_WORD = @"rs_words";
const NSString *KEY_PAGES = @"pages";
const NSString *KEY_TOTAL = @"total";
const NSString *KEY_RN_NUM = @"rn_num";
const NSString *KEY_SONG_LIST = @"song_list";
const NSString *KEY_ARTIST = @"artist";
const NSString *KEY_ALBUM = @"album";

@implementation BaiduMusicSearchResult

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if(self){
        [self fillDetailsWithDictionary:dic];
    }
    return self;
}

- (void)fillDetailsWithDictionary:(NSDictionary *)dic {
    id value = [dic objectForKey:KEY_QUERY];
    if(value && [value isKindOfClass:[NSString class]]){
        self.query = value;
    }
    value = [dic objectForKey:KEY_IS_ARTIST];
    if(value && [value isKindOfClass:[NSNumber class]]){
        self.isArtist = [value intValue];
    }
    value = [dic objectForKey:KEY_IS_ALBUM];
    if(value && [value isKindOfClass:[NSNumber class]]){
        self.isAlbum = [value intValue];
    }
    value = [dic objectForKey:KEY_RS_WORD];
    if(value && [value isKindOfClass:[NSString class]]){
        self.rsWords = value;
    }
    value = [dic objectForKey:KEY_TOTAL];
    if(value && [value isKindOfClass:[NSNumber class]]){
        self.total = [value intValue];
    }
    value = [dic objectForKey:KEY_RN_NUM];
    if(value && [value isKindOfClass:[NSNumber class]]){
        self.rnNum = [value intValue];
    }
    value = [dic objectForKey:KEY_SONG_LIST];
    if(value && [value isKindOfClass:[NSArray class]]){
        NSMutableArray *musicInfoArray = [[NSMutableArray alloc] init];
        NSArray *songList = value;
        for(NSDictionary *songDic in songList){
            BaiduMusicInfo *music = [[BaiduMusicInfo alloc] initWithDictionary:songDic];
            [musicInfoArray addObject:music];
        }
        self.songList = musicInfoArray;
    }
    if(self.isAlbum){
        value = [dic objectForKey:KEY_ALBUM];
        if(value && [value isKindOfClass:[NSDictionary class]]){
            self.album = [[AlbumInfo alloc] initWithDictionary:value];
        }
    }
    if(self.isArtist){
        value = [dic objectForKey:KEY_ARTIST];
        if(value && [value isKindOfClass:[NSDictionary class]]){
            self.artist = [[ArtistInfo alloc] initWithDictionary:value];
        }
    }
}

- (NSString *)description {
    return [StringUtils descriptionForObject:self showSuper:NO];
}

@end
