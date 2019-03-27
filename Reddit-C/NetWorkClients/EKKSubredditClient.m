//
//  EKKSubredditClient.m
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKSubredditClient.h"

@implementation EKKSubredditClient

+(NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}

+ (void)fetchAllSubRedditsForTitle:(NSString *)title completion:(void (^)(NSArray<EKKPost *> *posts))completion
{
    //Making a fetch request. We gotta make a URL request, component...ize, it, query...ize, it, then submit the request.
    NSURL *url = [[[EKKSubredditClient baseURL] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    NSLog(@"%@", [url absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        //Check that we have data. Do something with the data, including handle THAT error. GAH.
        if (!data) {
            NSLog(@"We got an error dealing with our data.");
            completion(nil);
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        
        NSMutableArray *postsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *postDictionary in childrenArray)
        {
            EKKPost *post = [[EKKPost alloc] initWithDict:postDictionary];
            NSLog(@"😼%@", post.title);
            [postsArray addObject:post];
        }
        completion(postsArray);
    }] resume];
}

@end
