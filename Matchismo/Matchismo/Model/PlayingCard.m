//
//  PlayingCard.m
//  Matchismo
//
//  Created by Jakub Radlak on 25.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    self.matchResult = @"";
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        score = [self scoreCard:self otherCard:otherCard score:score];
        [self prepareMatchResult:self otherCard:otherCard score:score];
    } else if ([otherCards count] > 1) {
        for (PlayingCard *otherCard in otherCards) {
            score = [self scoreCard:self otherCard:otherCard score:score];
        }
        
        score = [self scoreCard:otherCards[0] otherCard:otherCards[1] score:score];
    }
    
    return score;
}

- (int) scoreCard: (PlayingCard *) card
        otherCard: (PlayingCard *) otherCard
            score: (int) score
{
    if (otherCard.rank == card.rank) {
        score += 4;
    } else if ([otherCard.suit isEqualToString:card.suit]){
        score += 1;
    }
    
    return score;
}

- (void) prepareMatchResult: (PlayingCard *) card
                  otherCard: (PlayingCard *) otherCard
                      score: (int) score
{
    NSMutableString *result = [[NSMutableString alloc] init];
    if (score > 0) {
        [result appendString:@"Matched "];
        [result appendString:card.contents];
        [result appendString:@" "];
        [result appendString:otherCard.contents];
        [result appendString:@" for "];
        [result appendString:[NSString stringWithFormat:@"%d points.", score]];
    } else {
        [result appendString:card.contents];
        [result appendString:@" "];
        [result appendString:otherCard.contents];
        [result appendString:@" don't match! Penalty!"];
    }
    
    self.matchResult = [NSString stringWithString:result];
}

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *) rankStrings
{
    return @[@"?", @"2", @"3",@"4",@"5",@"6",@"7",
             @"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

@end
