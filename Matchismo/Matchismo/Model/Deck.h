//
//  Deck.h
//  Matchismo
//
//  Created by Jakub Radlak on 25.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTop:(BOOL)atTop;
-(void) addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
