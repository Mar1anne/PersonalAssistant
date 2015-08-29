//
//  PACallContactViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseAppearanceViewController.h"
#import "APContact.h"

@interface PACallContactViewController : PABaseAppearanceViewController

- (instancetype)initWithContact:(APContact *)contact;

@end
