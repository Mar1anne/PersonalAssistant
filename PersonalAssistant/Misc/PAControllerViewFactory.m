//
//  PAControllerViewFactory.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAControllerViewFactory.h"
#import "PAWeatherViewController.h"
#import "PAStartViewController.h"

@implementation PAControllerViewFactory

+ (UIView *)startView
{
    PAStartViewController *startController = [[PAStartViewController alloc] init];
    return startController.view;
}

+ (UIView *)weatherView
{
    PAWeatherViewController *weatherController = [[PAWeatherViewController alloc] init];
    return weatherController.view;
}

@end