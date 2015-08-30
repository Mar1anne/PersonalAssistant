//
//  PAReminderManager.h
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface PAReminderManager : NSObject

@property (nonatomic, strong) EKEventStore *eventStore;

@property (nonatomic) BOOL canAccessReminders;

+ (instancetype)sharedManager;

@end
