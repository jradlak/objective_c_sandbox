//
//  ViewController.h
//  Matchismo
//
//  Created by Jakub Radlak on 20.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//
// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController
// protected
// for subclasses
-(Deck *) createDeck; // abstract
@end

