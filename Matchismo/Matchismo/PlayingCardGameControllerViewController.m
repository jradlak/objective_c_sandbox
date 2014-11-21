//
//  PlayingCardGameControllerViewController.m
//  Matchismo
//
//  Created by Jakub Radlak on 21.11.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "PlayingCardGameControllerViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameControllerViewController ()

@end

@implementation PlayingCardGameControllerViewController

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
