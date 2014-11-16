//
//  Card.h
//  Matchismo
//
//  Created by Jakub Radlak on 24.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

@property (strong, nonatomic) NSString *matchResult;

- (int)match:(NSArray *)otherCards;
@end
