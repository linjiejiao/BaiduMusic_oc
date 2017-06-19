//
//  StringUtils.m
//  BaiduMusic
//
//  Created by liangjiajian_mac on 2017/6/19.
//  Copyright © 2017年 liangjiajian. All rights reserved.
//

#import "StringUtils.h"
#import "objc/runtime.h"

@implementation StringUtils

+ (NSString *)fixString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"<em>" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"</em>" withString:@""];
    return string;
}

+ (NSString *)fixUrl:(NSString *)string {
    NSRange rang = [string rangeOfString:@"http://" options:NSBackwardsSearch];
    if(rang.location != NSNotFound){
        string = [string substringFromIndex:rang.location];
    }
    return string;
}

+ (NSString *)descriptionForObject:(NSObject *)object showSuper:(BOOL)showSuper {
    NSString * desc = @"";
    if(showSuper){
        NSMutableArray *superDescs = [[NSMutableArray alloc] init];
        Class class = [object class];
        [superDescs addObject:[self descriptionForObject:object class:class]];
        while([class superclass] != [NSObject class]){
            class = [class superclass];
            [superDescs addObject:[self descriptionForObject:object class:class]];
        }
        desc = [NSString stringWithFormat:@"{%@}", [superDescs componentsJoinedByString:@",\n "]];
    }else{
        desc = [self descriptionForObject:object class:[object class]];
    }
    return desc;
}

+ (NSString *)descriptionForObject:(NSObject *)object class:(Class)class {
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList(class, &propertyCount);
    NSMutableArray *propertyParis = [[NSMutableArray alloc] init];
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        if (propName) {
            NSString *prop = [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
            id obj = [object valueForKey:prop];
            [propertyParis addObject:[NSString stringWithFormat:@"%@=%@", prop, obj]];
        }
    }
    free(properties);
    NSString * desc = [NSString stringWithFormat:@"%@[%@]", NSStringFromClass(class), [propertyParis componentsJoinedByString:@", "]];
    return desc;
}
@end
