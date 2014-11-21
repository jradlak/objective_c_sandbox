//
//  ViewController.m
//  Matchismo
//
//  Created by Jakub Radlak on 20.10.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic) BOOL gameStarted;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISwitch *gameMode;
@property (weak, nonatomic) IBOutlet UILabel *cards2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *cards3Lbl;
@property (weak, nonatomic) IBOutlet UILabel *gameStatus;
@end

@implementation ViewController

-(CardMatchingGame *) game
{
    if (!_game) _game = [self newGame];
    return _game;
}

- (Deck *) deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}
    
-(Deck *) createDeck // abstract
{
    return nil;
}

-(CardMatchingGame *) newGame
{
    int numberOfCards = 1;
    if ([self.gameMode isOn])
    {
        numberOfCards = 2;
    }
   
    return[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                            numberCards:numberOfCards
                                             usingDeck:[self createDeck]];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if (!self.gameStarted) {
        self.gameStarted = YES;
        [self hideOrShowGameModeControlls:YES];
    }
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    self.gameStatus.text = self.game.gameStatus;
    [self updateUI];
}

- (IBAction)touchResetButton:(UIButton *)sender
{
    self.gameStarted = NO;
    [self hideOrShowGameModeControlls:NO];
    self.game = [self newGame];
    [self updateUI];
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

-(NSString *) titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *) backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

-(void) hideOrShowGameModeControlls:(BOOL) hide
{
    self.gameMode.hidden = hide;
    self.cards2Lbl.hidden = hide;
    self.cards3Lbl.hidden = hide;
}

@end
