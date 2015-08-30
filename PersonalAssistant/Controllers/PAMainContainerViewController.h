//
//  PAMainContainerViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseViewController.h"
#import "APContact.h"

@interface PAMainContainerViewController : PABaseViewController

- (instancetype)initWithSelection:(NSInteger)selection;

- (void)openSmsControllerForContact:(APContact *)contact;

- (void)openEmailControllerForContact:(APContact *)contact;

- (void)openCallControllerForContact:(APContact *)contact;

@end
