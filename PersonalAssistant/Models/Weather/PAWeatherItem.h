//
//  PAWeatherItem.h
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAWeatherItem : NSObject

@property (nonatomic) int indexForWeatherMap;

@property (nonatomic, strong) UIImage *weatherCurrentTempImage;

@property (nonatomic, strong) NSArray *nextDays;
@property (nonatomic, strong) NSArray *weatherForecast;
@property (nonatomic, strong) NSArray *weatherForecastConditions;
@property (nonatomic, strong) NSArray *weatherForecastConditionsImages;

@property (nonatomic, strong) NSString *weatherCode;
@property (nonatomic, strong) NSString *weatherPrecipitationAmount;
@property (nonatomic, strong) NSString *weatherHumidity;
@property (nonatomic, strong) NSString *weatherWindSpeed;
@property (nonatomic, strong) NSString *weatherCurrentDay;
@property (nonatomic, strong) NSString *weatherCurrentTemp;

-(id)initWithCurrentTemp:(NSString *)currentTemp
              currentDay:(NSString *)currentDay
                forecast:(NSArray *)forecast
      forecastConditions:(NSArray *)forecastConditions;

@end
