//
//  PALocationManager.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PALocationManager.h"

@interface PALocationManager ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) BOOL didUpdate;

@end

@implementation PALocationManager

+ (id)sharedManager
{
    static PALocationManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (id)init
{
    if (self = [super init]) {
        self.didUpdate = NO;
    }
    return self;
}

- (void)startUpdates
{
    if (!self.locationManager) {
        self.locationManager = [CLLocationManager new];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    }
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Your location could not be determined. Please try again later"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)locationManager:(CLLocationManager *)manage
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (self.didUpdate) return;
    
    self.didUpdate = YES;
    
    // Disable future updates to save power.
    [self.locationManager stopUpdatingLocation];
    
    if ([self.delegate respondsToSelector:@selector(didLocateNewUserLocation:)]) {
        [self.delegate didLocateNewUserLocation:newLocation];
    }
}

@end
