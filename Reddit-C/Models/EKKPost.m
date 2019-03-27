//
//  EKKPost.m
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKPost.h"

@implementation EKKPost

- (instancetype)initWithTitle:(NSString *)title ups:(NSNumber *)ups commentCount:(NSNumber *)commentCount
{
    {
        self = [super init];
        if (self) {
            _title = [title copy];
            _commentCount = commentCount;
            _ups = ups;
        }
        return self;
    }
}


- (instancetype)initWithDict:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[[EKKPost titleKey]];
    NSNumber *commentCount = dataDictionary[[EKKPost commentCountKey]];
    NSNumber *upvotes = dataDictionary[[EKKPost upsKey]];
    
   return [self initWithTitle:title ups:upvotes commentCount:commentCount];
}

+(NSString *)titleKey
{
    return @"title";
}

+(NSString *)commentCountKey
{
    return @"num_comments";
}

+(NSString *)upsKey
{
    return @"ups";
}

@end
