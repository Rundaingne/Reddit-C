//
//  EKKPost.h
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EKKPost : NSObject

//Properties
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *ups;
@property (nonatomic, readonly) NSNumber *commentCount;

//Initializer
-(instancetype)initWithTitle:(NSString *)title ups:(NSNumber *)ups commentCount:(NSNumber *)commentCount;

-(instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
