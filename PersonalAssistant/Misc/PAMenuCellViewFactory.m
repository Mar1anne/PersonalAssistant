//
//  PAMenuCellViewFactory.m
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuCellViewFactory.h"

@implementation PAMenuCellViewFactory

+ (NSString *)itemNameForIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            return @"Send message";
            break;
        case 1:
            return @"Call";
            break;
        case 2:
            return @"Send an email";
            break;
        case 3:
            return @"Find places";
            break;
        case 4:
            return @"Weather";
            break;
        case 5:
            return @"Reminders";
            break;
        case 6:
            return @"Twitter";
            break;
        case 7:
            return @"Facebook";
            break;
        case 8:
            return @"Surf";
            break;
        default:
            return nil;
            break;
    }
}

+ (UIImage *)itemImageForIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            return [UIImage imageNamed:@"messages"];
            break;
        case 1:
            return [UIImage imageNamed:@"calls"];
            break;
        case 2:
            return [UIImage imageNamed:@"emails"];
            break;
        case 3:
            return [UIImage imageNamed:@"places"];
            break;
        case 4:
            return [UIImage imageNamed:@"weather"];
            break;
        case 5:
            return [UIImage imageNamed:@"reminders"];
            break;
        case 6:
            return [UIImage imageNamed:@"twitter"];
            break;
        case 7:
            return [UIImage imageNamed:@"facebook"];
            break;
        case 8:
            return [UIImage imageNamed:@"surf"];
            break;
        default:
            return nil;
            break;
    }
}

+ (NSString *)selectorNameForItemAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            return @"onSendMessageClick";
            break;
        case 1:
            return @"onCallNumberClick";
            break;
        case 2:
            return @"onSendEmailClick";
            break;
        case 3:
            return @"onFindPlacesClick";
            break;
        case 4:
            return @"onWeatherClick";
            break;
        case 5:
            return @"onRemindersClick";
            break;
        case 6:
            return @"onTwitterClick";
            break;
        case 7:
            return @"onFacebookClick";
            break;
        case 8:
            return @"onSurfClick";
            break;
        default:
            return @"onSurfClick";
            break;
    }
}

@end
