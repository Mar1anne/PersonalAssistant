//
//  PAReminderManager.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAReminderManager.h"

@interface PAReminderManager ()


@end

@implementation PAReminderManager

+ (instancetype)sharedManager
{
    static PAReminderManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.eventStore = [[EKEventStore alloc] init];
        [self requestEventKitAccess];
    }
    return self;
}

- (void)requestEventKitAccess
{
    [self.eventStore requestAccessToEntityType:EKEntityTypeReminder
                                    completion:^(BOOL granted, NSError *error)
     {
         self.canAccessReminders = granted;
     }];
}

@end
