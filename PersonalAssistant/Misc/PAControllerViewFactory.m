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
#import "PAWebViewController.h"
#import "PACallContactViewController.h"
#import "PASmsViewController.h"

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

+ (UIView *)webViewForKeyword:(NSString *)keyword
{
    PAWebViewController *webController = [[PAWebViewController alloc] initWithKeyword:keyword];
    return webController.view;
}

+ (UIView *)callerViewForContact:(APContact *)contact
{
    PACallContactViewController *callController = [[PACallContactViewController alloc] initWithContact:contact];
    return callController.view;
}

+ (UIView *)messageViewForContact:(APContact *)contact
{
    PASmsViewController *smsController = [[PASmsViewController alloc] initWithContact:contact];
    return smsController.view;
}

@end
