//
//  BaiduMusicInfo.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "BaiduMusicInfo.h"
#import "StringUtils.h"

const NSString *KEY_TITLE = @"title";
const NSString *KEY_SONG_ID = @"song_id";
const NSString *KEY_AUTHOR = @"author";
const NSString *KEY_ARTIST_ID = @"artist_id";
const NSString *KEY_ALL_ARTIST_ID = @"all_artist_id";
const NSString *KEY_ALBUM_TITLE = @"album_title";
const NSString *KEY_APPENDIX = @"appendix";
const NSString *KEY_ALBUM_ID = @"album_id";
const NSString *KEY_LRC_LINK = @"lrclink";
const NSString *KEY_RESOURCE_TYPE = @"resource_type";
const NSString *KEY_CONTENT = @"content";
const NSString *KEY_RELATE_STATUS = @"relate_status";
const NSString *KEY_HAVE_HIGH = @"havehigh";
const NSString *KEY_COPY_TYPE = @"copy_type";
const NSString *KEY_DEL_STATUS = @"del_status";
const NSString *KEY_ALL_RATE = @"all_rate";
const NSString *KEY_HAS_MV = @"has_mv";
const NSString *KEY_HAS_MV_MOBILE = @"has_mv_mobile";
const NSString *KEY_MV_PROVIDER = @"mv_provider";
const NSString *KEY_CHARGE = @"charge";
const NSString *KEY_TONE_ID = @"toneid";
const NSString *KEY_INFO = @"info";
const NSString *KEY_DATA_SOURCE = @"data_source";
const NSString *KEY_LEARN = @"learn";
//
const NSString *KEY_SONG_PIC_SMALL = @"songPicSmall";
const NSString *KEY_SONG_PIC_BIG = @"songPicBig";
const NSString *KEY_SONG_PIC_RADIO = @"songPicRadio";
const NSString *KEY_SONG_LINK = @"songLink";
const NSString *KEY_FORMAT = @"format";
const NSString *KEY_RATE = @"rate";
const NSString *KEY_SIZE = @"size";
const NSString *KEY_TIME = @"time";
const NSString *KEY_LINK_CODE = @"linkCode";
const NSString *KEY_SHOW_LINK = @"songLink";
const NSString *KEY_XCODE = @"xcode";

@implementation BaiduMusicInfo

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if(self){
        [self fillDetailsWithDictionary:dic];
    }
    return self;
}

- (void)fillDetailsWithDictionary:(NSDictionary *)dic {
    id value = [dic objectForKey:KEY_TITLE];
    if(value && [value isKindOfClass:[NSString class]]){
        self.title = [StringUtils fixString:value];
    }
    value = [dic objectForKey:KEY_SONG_ID];
    if(value){
        self.songId = [value intValue];
    }
    value = [dic objectForKey:KEY_AUTHOR];
    if(value && [value isKindOfClass:[NSString class]]){
        self.author = [StringUtils fixString:value];;
    }
    value = [dic objectForKey:KEY_ARTIST_ID];
    if(value){
        self.artistId = [value intValue];
    }
    value = [dic objectForKey:KEY_ALL_ARTIST_ID];
    if(value && [value isKindOfClass:[NSString class]]){
        self.allArtistId = value;
    }
    value = [dic objectForKey:KEY_ALBUM_TITLE];
    if(value && [value isKindOfClass:[NSString class]]){
        self.albumTitle = [StringUtils fixString:value];;
    }
    value = [dic objectForKey:KEY_APPENDIX];
    if(value && [value isKindOfClass:[NSString class]]){
        self.appendix = value;
    }
    value = [dic objectForKey:KEY_ALBUM_ID];
    if(value){
        self.albumId = [value intValue];
    }
    value = [dic objectForKey:KEY_LRC_LINK];
    if(value && [value isKindOfClass:[NSString class]]){
        NSString *link = [NSString stringWithFormat:@"http://ting.baidu.com%@", value];
        self.lrcLink = [StringUtils fixUrl:link];
    }
    value = [dic objectForKey:KEY_RESOURCE_TYPE];
    if(value){
        self.resourceType = [value intValue];
    }
    value = [dic objectForKey:KEY_CONTENT];
    if(value && [value isKindOfClass:[NSString class]]){
        self.content = [StringUtils fixString:value];;
    }
    value = [dic objectForKey:KEY_RELATE_STATUS];
    if(value){
        self.relateStatus = [value intValue];
    }
    value = [dic objectForKey:KEY_HAVE_HIGH];
    if(value){
        self.haveHigh = [value intValue];
    }
    value = [dic objectForKey:KEY_COPY_TYPE];
    if(value){
        self.copyType = [value intValue];
    }
    value = [dic objectForKey:KEY_DEL_STATUS];
    if(value){
        self.delStatus = [value intValue];
    }
    value = [dic objectForKey:KEY_ALL_RATE];
    if(value && [value isKindOfClass:[NSString class]]){
        self.allRate = value;
    }
    value = [dic objectForKey:KEY_HAS_MV];
    if(value){
        self.hasMv = [value intValue];
    }
    value = [dic objectForKey:KEY_HAS_MV_MOBILE];
    if(value){
        self.hasMvMobile = [value intValue];
    }
    value = [dic objectForKey:KEY_MV_PROVIDER];
    if(value && [value isKindOfClass:[NSString class]]){
        self.mvProvider = [StringUtils fixString:value];;
    }
    value = [dic objectForKey:KEY_CHARGE];
    if(value){
        self.charge = [value intValue];
    }
    value = [dic objectForKey:KEY_TONE_ID];
    if(value && [value isKindOfClass:[NSString class]]){
        self.toneId = value;
    }
    value = [dic objectForKey:KEY_INFO];
    if(value && [value isKindOfClass:[NSString class]]){
        self.info = [StringUtils fixString:value];;
    }
    value = [dic objectForKey:KEY_DATA_SOURCE];
    if(value){
        self.dataSource = [value intValue];
    }
    value = [dic objectForKey:KEY_LEARN];
    if(value){
        self.learn = [value intValue];
    }
    //
    value = [dic objectForKey:KEY_SONG_PIC_SMALL];
    if(value && [value isKindOfClass:[NSString class]]){
        self.songPicSmall = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_SONG_PIC_BIG];
    if(value && [value isKindOfClass:[NSString class]]){
        self.songPicBig = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_SONG_PIC_RADIO];
    if(value && [value isKindOfClass:[NSString class]]){
        self.songPicRadio = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_SONG_LINK];
    if(value && [value isKindOfClass:[NSString class]]){
        self.songLink = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_SHOW_LINK];
    if(value && [value isKindOfClass:[NSString class]]){
        self.showLink = [StringUtils fixUrl:value];
    }
    value = [dic objectForKey:KEY_FORMAT];
    if(value && [value isKindOfClass:[NSString class]]){
        self.format = value;
    }
    value = [dic objectForKey:KEY_RATE];
    if(value){
        self.rate = [value intValue];
    }
    value = [dic objectForKey:KEY_SIZE];
    if(value){
        self.size = [value intValue];
    }
    value = [dic objectForKey:KEY_TIME];
    if(value){
        self.time = [value intValue];
    }
//    value = [dic objectForKey:KEY_LINK_CODE];
//    if(value){
//        self.linkCode = [value intValue];
//    }
    value = [dic objectForKey:KEY_XCODE];
    if(value && [value isKindOfClass:[NSString class]]){
        self.xcode = value;
    }
}

- (NSString *)description {
    return [StringUtils descriptionForObject:self showSuper:NO];
}

@end
