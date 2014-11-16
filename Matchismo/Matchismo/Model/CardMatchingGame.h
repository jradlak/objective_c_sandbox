//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jakub Radlak on 26.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount:(NSUInteger) count
                      numberCards:(NSUInteger) numberCards
                        usingDeck:(Deck *) deck;

-(void) chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (strong, nonatomic) NSString *gameStatus;

@end
