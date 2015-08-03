//
//  PAControllerManager.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAControllerManager.h"
#import "PAContactListViewController.h"

@implementation PAControllerManager

+ (UIWindow *)mainWindow
{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
}

+ (void)showContactsControllerFromController:(UIViewController *)controller type:(PAContactsListType)type
{
    PAContactListViewController *contactsController = [[PAContactListViewController alloc] initWithType:type];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:contactsController];

    if (controller.navigationController) {
        [controller.navigationController presentViewController:navController animated:YES completion:nil];
    } else {
        [controller presentViewController:navController animated:YES completion:nil];
    }
}

@end
