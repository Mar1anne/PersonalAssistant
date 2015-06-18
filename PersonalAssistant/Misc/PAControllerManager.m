//
//  PAControllerManager.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAControllerManager.h"

@implementation PAControllerManager

+ (UIWindow *)mainWindow
{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
}

@end
