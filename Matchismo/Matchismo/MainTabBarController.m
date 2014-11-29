//
//  MainTabBarController.m
//  Matchismo
//
//  Created by Jakub Radlak on 25.11.2014.
//  Copyright (c) 2014 Jakub Radlak. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = [UIColor blackColor];
    
    UITabBarItem *item0 = [self.tabBar.items objectAtIndex:0];
    item0.image = [[UIImage imageNamed:@"card_game"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:1];
    item1.image = [[UIImage imageNamed:@"set_game"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
