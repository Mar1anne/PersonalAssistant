//
//  PALocationManager.h
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol PALocationManagerDelegate;

@interface PALocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, assign) id <PALocationManagerDelegate>delegate;

+ (id)sharedManager;
- (void)startUpdates;

@end

@protocol PALocationManagerDelegate <NSObject>

- (void)didLocateNewUserLocation:(CLLocation *)location;

@end