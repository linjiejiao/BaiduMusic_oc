//
//  BaiduMusicInfo.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaiduMusicInfo : NSObject
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) int songId;
@property (copy, nonatomic) NSString *author;
@property (assign, nonatomic) int artistId;
@property (copy, nonatomic) NSString *allArtistId;
@property (copy, nonatomic) NSString *albumTitle;
@property (copy, nonatomic) NSString *appendix;
@property (assign, nonatomic) int albumId;
@property (copy, nonatomic) NSString *lrcLink;
@property (assign, nonatomic) int resourceType;
@property (copy, nonatomic) NSString *content;
@property (assign, nonatomic) int relateStatus;
@property (assign, nonatomic) int haveHigh;
@property (assign, nonatomic) int copyType;
@property (assign, nonatomic) int delStatus;
@property (copy, nonatomic) NSString *allRate;
@property (assign, nonatomic) int hasMv;
@property (assign, nonatomic) int hasMvMobile;
@property (copy, nonatomic) NSString *mvProvider;
@property (assign, nonatomic) int charge;
@property (copy, nonatomic) NSString *toneId;
@property (copy, nonatomic) NSString *info;
@property (assign, nonatomic) int dataSource;
@property (assign, nonatomic) int learn;
// second fetch
@property (assign, nonatomic) BOOL isDetailFetched;
// second fetch detail
@property (copy, nonatomic) NSString *songPicSmall;
@property (copy, nonatomic) NSString *songPicBig;
@property (copy, nonatomic) NSString *songPicRadio;
@property (copy, nonatomic) NSString *songLink;
@property (copy, nonatomic) NSString *showLink;
@property (copy, nonatomic) NSString *format;
@property (assign, nonatomic) int rate;
@property (assign, nonatomic) int size;
@property (assign, nonatomic) int time;
@property (assign, nonatomic) int linkCode;
//
@property (copy, nonatomic) NSString *xcode;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
- (void)fillDetailsWithDictionary:(NSDictionary *)dic;

@end
