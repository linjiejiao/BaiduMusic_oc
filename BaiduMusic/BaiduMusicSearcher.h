//
//  BaiduMusicSearcher.h
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduMusicSearchResult.h"

@interface BaiduMusicSearcher : NSObject

+ (BaiduMusicSearcher *)shareInstance;

- (void)fullySearchWithKey:(NSString *)query pageSize:(int)pageSize pageNum:(int)pageNum completion:(void(^)(BaiduMusicSearchResult *resut, NSError *error))completion; /// search and fetch detail

- (void)searchWithKey:(NSString *)query pageSize:(int)pageSize pageNum:(int)pageNum completion:(void(^)(BaiduMusicSearchResult *resut, NSError *error))completion; /// search brief info

- (void)fetchMusicDetailsWithMusic:(NSArray<BaiduMusicInfo *> *)musicInfos rate:(NSString *)rate completion:(void(^)(NSArray<BaiduMusicInfo *> *musicInfos, NSError *error))completion; /// fetch detail

@end
