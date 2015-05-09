//
//  PAControllerManager.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAControllerManager.h"
#import "PATabBaritem.h"
#import "PABaseViewController.h"
#import "PARemindersViewController.h"
#import "PASendMessageViewController.h"
#import "PACallContactViewController.h"

@implementation PAControllerManager

+ (PAContainerViewController *)getMainMenuController
{
    PACallContactViewController *callController = [[PACallContactViewController alloc] init];
    PASendMessageViewController *messageController = [[PASendMessageViewController alloc] init];
    PARemindersViewController *reminderController = [[PARemindersViewController alloc] init];

    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:callController];
    
    PATabBaritem *item1 = [[PATabBaritem alloc]init];
    [item1 setDefaultImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item1 setSelectedImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item1 setHighlightedImage:[UIImage imageNamed:@"test_bar_icon"]];
    item1.viewController = navController1;
    
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:messageController];
    
    PATabBaritem *item2 = [[PATabBaritem alloc]init];
    [item2 setDefaultImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item2 setSelectedImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item2 setHighlightedImage:[UIImage imageNamed:@"test_bar_icon"]];
    item2.viewController = navController2;
    
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:reminderController];
    
    PATabBaritem *item3 = [[PATabBaritem alloc]init];
    [item3 setDefaultImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item3 setSelectedImage:[UIImage imageNamed:@"test_bar_icon"]];
    [item3 setHighlightedImage:[UIImage imageNamed:@"test_bar_icon"]];
    item3.viewController = navController3;
    
    PAContainerViewController *mainMenuController = [[PAContainerViewController alloc] init];
    mainMenuController.tabBarItems = @[item1,item2,item3];
    
    return mainMenuController;
}

@end
