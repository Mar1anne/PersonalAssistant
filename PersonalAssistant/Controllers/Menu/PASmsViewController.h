//
//  PASmsViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseAppearanceViewController.h"

@interface PASmsViewController : PABaseAppearanceViewController

- (instancetype)initWithContact:(APContact *)contact;

- (void)updateWithContact:(APContact *)contact;

@end
