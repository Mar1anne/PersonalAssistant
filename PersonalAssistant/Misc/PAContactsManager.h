//
//  PAContactsManager.h
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APAddressBook.h"
#import "APContact.h"

@interface PAContactsManager : NSObject

@property (nonatomic, readonly) NSMutableArray *emailContacts;
@property (nonatomic, readonly) NSMutableArray *phoneContacts;
@property (nonatomic, readonly) NSMutableArray *allContacts;

+ (instancetype)sharedManager;

@end
