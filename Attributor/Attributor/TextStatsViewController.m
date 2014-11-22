//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Jakub Radlak on 22.11.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;
@end

@implementation TextStatsViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    // for testing purposes:
    /*
    self.textToAnalize = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSStrokeWidthAttributeName : @-3} ];
    */
}

-(void) setTextToAnalize:(NSAttributedString *)textToAnalize
{
    _textToAnalize = textToAnalize;
    if (self.view.window) [self updateUI];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI
{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", (unsigned long)[[self charctersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters", (unsigned long)[[self charctersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *) charctersWithAttribute:(NSString *) attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    unsigned long index = 0;
    while (index < [self.textToAnalize length]) {
        NSRange range;
        id value = [self.textToAnalize attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalize attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index++;
        }
    }
    
    return characters;
}

@end
