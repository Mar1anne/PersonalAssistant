//
//  PAControllerManager.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAContactListViewController.h"

@interface PAControllerManager : NSObject

+ (UIWindow *)mainWindow;

+ (void)showContactsControllerFromController:(UIViewController *)controller
                                        type:(PAContactsListType)type;

@end
