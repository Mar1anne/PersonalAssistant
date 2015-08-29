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

@interface PAControllerViewFactory ()

@property (nonatomic, strong) PAStartViewController *startController;
@property (nonatomic, strong) PAWeatherViewController *weatherController;
@property (nonatomic, strong) PAWebViewController *webController;
@property (nonatomic, strong) PACallContactViewController *callController;
@property (nonatomic, strong) PASmsViewController *smsController;

@end

@implementation PAControllerViewFactory

+ (instancetype)sharedFactory
{
    static PAControllerViewFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[self alloc] init];
    });
    
    return factory;
}

- (UIView *)startView
{
    self.startController = [[PAStartViewController alloc] init];
    return self.startController.view;
}

- (UIView *)weatherView
{
    self.weatherController = [[PAWeatherViewController alloc] init];
    return self.weatherController.view;
}

- (UIView *)webViewForKeyword:(NSString *)keyword
{
    self.webController = [[PAWebViewController alloc] initWithKeyword:keyword];
    return self.webController.view;
}

- (UIView *)callerViewForContact:(APContact *)contact
{
    self.callController = [[PACallContactViewController alloc] initWithContact:contact];
    return self.callController.view;
}

- (UIView *)messageViewForContact:(APContact *)contact
{
    self.smsController = [[PASmsViewController alloc] initWithContact:contact];
    return self.smsController.view;
}

@end
