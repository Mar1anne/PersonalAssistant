//
//  PAContact.m
//  PersonalAssistant
//
//  Created by Mariana on 7/19/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContact.h"

@implementation PAContact

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
