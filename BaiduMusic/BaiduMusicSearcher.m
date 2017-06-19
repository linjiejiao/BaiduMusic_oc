//
//  BaiduMusicSearcher.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "BaiduMusicSearcher.h"

const NSString *BAIDU_QUERY_BASE = @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.search.common&format=json&from=ios&version=4.1.1";
const NSString *BAIDU_SONG_DETAIL_BASE = @"http://ting.baidu.com/data/music/links?songIds=";

@interface BaiduMusicSearcher ()
@property (strong, nonatomic) dispatch_queue_t searchDispatchQueue;

@end

@implementation BaiduMusicSearcher

+ (BaiduMusicSearcher *)shareInstance {
    static BaiduMusicSearcher *sInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[BaiduMusicSearcher alloc] init];
    });
    return sInstance;
}

- (instancetype)init {
    self = [super init];
    if(self){
        self.searchDispatchQueue = dispatch_queue_create("baidu_music_searcher", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)fullySearchWithKey:(NSString *)query pageSize:(int)pageSize pageNum:(int)pageNum completion:(void(^)(BaiduMusicSearchResult *resut, NSError *error))completion {
    __weak typeof(self) weakSelf = self;
    [self searchWithKey:query pageSize:pageSize pageNum:pageNum completion:^(BaiduMusicSearchResult *resut, NSError *error) {
        if(error){
            if(completion){
                completion(resut, error);
            }
            return;
        }
        typeof(self) strongSelf = weakSelf;
        if(!strongSelf){
            if(completion){
                completion(resut, error);
            }
            return;
        }
        [strongSelf fetchMusicDetailsWithMusic:resut.songList rate:nil completion:^(NSArray<BaiduMusicInfo *> *musicInfos, NSError *fetchDetailsError) {
            if(completion){
                completion(resut, fetchDetailsError);
            }
        }];
    }];
}

- (void)searchWithKey:(NSString *)query pageSize:(int)pageSize pageNum:(int)pageNum completion:(void(^)(BaiduMusicSearchResult *resut, NSError *error))completion {
    if(query.length <= 0){
        if(completion){
            completion(nil, [NSError errorWithDomain:@"searchWithKey query empty!" code:0 userInfo:nil]);
        }
        return;
    }
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *queryUrl = [NSString stringWithFormat:@"%@&page_size=%d&page_no=%d&query=%@", BAIDU_QUERY_BASE, pageSize, pageNum, query];
    dispatch_async(self.searchDispatchQueue, ^{
        NSURL *url = [NSURL URLWithString:queryUrl];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"GET";
        NSURLResponse *respond;
        NSError *error;
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&respond error:&error];
        if(error){
            if(completion){
                completion(nil, error);
            }
            return;
        }else{
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
            if(error){
                if(completion){
                    completion(nil, error);
                }
                return;
            }else{
                BaiduMusicSearchResult *resut = [[BaiduMusicSearchResult alloc] initWithDictionary:dic];
                if(completion){
                    completion(resut, error);
                }
            }
        }
    });
}

- (void)fetchMusicDetailsWithMusic:(NSArray<BaiduMusicInfo *> *)musicInfos rate:(NSString *)rate completion:(void(^)(NSArray<BaiduMusicInfo *> *musicInfos, NSError *error))completion {
    NSMutableArray *songIds = [[NSMutableArray alloc] init];
    NSMutableDictionary *songIds2MusicInfo = [[NSMutableDictionary alloc] init];
    for(BaiduMusicInfo *music in musicInfos){
        [songIds addObject:@(music.songId)];
        [songIds2MusicInfo setObject:music forKey:@(music.songId)];
    }
    NSString *queryUrl = [NSString stringWithFormat:@"%@%@%@", BAIDU_SONG_DETAIL_BASE, [songIds componentsJoinedByString:@","], rate?rate:@""];
    dispatch_async(self.searchDispatchQueue, ^{
        NSURL *url = [NSURL URLWithString:queryUrl];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"GET";
        NSURLResponse *respond;
        NSError *error;
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&respond error:&error];
        if(error){
            if(completion){
                completion(nil, error);
            }
            return;
        }else{
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
            if(error){
                if(completion){
                    completion(nil, error);
                }
                return;
            }else{
                int errorCode = [[dic objectForKey:@"errorCode"] intValue];
                if(errorCode != 22000){
                    if(completion){
                        completion(nil, [NSError errorWithDomain:@"fetchMusicDetailsWithMusic respond error" code:errorCode userInfo:dic]);
                    }
                    return;
                }
                NSDictionary *dataDic = [dic objectForKey:@"data"];
                NSString *xcode = [dataDic objectForKey:@"xcode"];
                NSArray<NSDictionary *> *songList = [dataDic objectForKey:@"songList"];
                for(NSDictionary *dictionary in songList){
                    int songId = [[dictionary objectForKey:@"songId"] intValue];
                    BaiduMusicInfo *music = [songIds2MusicInfo objectForKey:@(songId)];
                    if(music){
                        music.xcode = xcode;
                        [music fillDetailsWithDictionary:dictionary];
                    }
                }
                if(completion){
                    completion(musicInfos, nil);
                }
            }
        }
    });
}
@end
