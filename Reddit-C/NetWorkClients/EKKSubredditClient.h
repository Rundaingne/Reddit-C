//
//  EKKSubredditClient.h
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKKPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKKSubredditClient : NSObject

+(void)fetchAllSubRedditsForTitle:(NSString *)title completion:(void(^)(NSArray<EKKPost *> *posts))completion;

@end

NS_ASSUME_NONNULL_END
