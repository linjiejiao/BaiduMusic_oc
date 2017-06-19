//
//  BaiduMusicSearchResult.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduMusicInfo.h"
#import "ArtistInfo.h"
#import "AlbumInfo.h"

@interface BaiduMusicSearchResult : NSObject
@property (copy, nonatomic) NSString *query;
@property (assign, nonatomic) int isArtist;
@property (assign, nonatomic) int isAlbum;
@property (copy, nonatomic) NSString *rsWords;
@property (assign, nonatomic) int total;
@property (assign, nonatomic) int rnNum;
@property (strong, nonatomic) NSArray<BaiduMusicInfo *> *songList;
@property (strong, nonatomic) ArtistInfo *artist;
@property (strong, nonatomic) AlbumInfo *album;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
