//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jakub Radlak on 26.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) NSUInteger numberCardsToMatch;
@end

@implementation CardMatchingGame

-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(instancetype) initWithCardCount:(NSUInteger) count
                        numberCards:(NSUInteger) numberCards
                        usingDeck:(Deck *) deck
{
    self = [super init];
    
    if (self) {
        self.numberCardsToMatch = numberCards;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ?  self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *cardsToMatch = [[NSMutableArray alloc] init];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another chosen card
            for (Card *otherCard in self.cards) {
                if (card != otherCard && otherCard.isChosen && !otherCard.isMatched) {
                    [cardsToMatch addObject:otherCard];
                    if ([cardsToMatch count] == self.numberCardsToMatch) {
                        int matchScore = [card match:cardsToMatch];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            for (Card *crd in cardsToMatch) {
                                crd.matched = YES;
                            }
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            for (Card *crd in cardsToMatch) {
                                crd.chosen = NO;
                            }
                        }
                        
                        self.gameStatus = card.matchResult;
                        break;
                    }
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
