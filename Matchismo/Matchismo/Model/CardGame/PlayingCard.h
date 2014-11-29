//
//  PlayingCard.h
//  Matchismo
//
//  Created by Jakub Radlak on 25.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "Card.h"


@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *matchResult;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
