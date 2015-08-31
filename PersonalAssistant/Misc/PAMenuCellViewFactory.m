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
            return @"SMS";
            break;
        case 1:
            return @"Call";
            break;
        case 2:
            return @"Sendemail";
            break;
        case 3:
            return @"Weather";
            break;
        case 4:
            return @"Reminders";
            break;
        case 5:
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
            return [UIImage imageNamed:@"weather"];
            break;
        case 4:
            return [UIImage imageNamed:@"reminders"];
            break;
        case 5:
            return [UIImage imageNamed:@"surf"];
            break;
        default:
            return nil;
            break;
    }
}

@end
