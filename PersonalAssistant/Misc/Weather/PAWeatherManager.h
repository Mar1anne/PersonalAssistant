//
//  PAWeatherManager.h
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Reachability.h"
#import "PALocationManager.h"
#import "PAWeatherItem+Parse.h"
#import <MapKit/MapKit.h>

@protocol PAWeatherManagerDelegate;

@interface PAWeatherManager : NSObject <PALocationManagerDelegate>

@property (nonatomic, assign) id <PAWeatherManagerDelegate>delegate;

+(id)sharedManager;

-(void)startUpdatingLocation;
-(PAWeatherItem *)currentWeatherItem;

@end

@protocol PAWeatherManagerDelegate <NSObject>

-(void)didRecieveAndParseNewWeatherItem:(PAWeatherItem *)item;

@end