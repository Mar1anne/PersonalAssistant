//
//  PAContactListViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 5/10/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseAppearanceViewController.h"

typedef NS_ENUM(NSInteger, PAContactsListType) {
    PAContactsListTypeSMS,
    PAContactsListTypeCall,
    PAContactsListTypeEmail
};

@interface PAContactListViewController : PABaseAppearanceViewController

@property (nonatomic) PAContactsListType type;

- (instancetype)initWithType:(PAContactsListType)type;

@end
