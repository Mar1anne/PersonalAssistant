//
//  PAWeatherItem.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWeatherItem.h"

@implementation PAWeatherItem

- (id)initWithCurrentTemp:(NSString *)currentTemp
               currentDay:(NSString *)currentDay
                 forecast:(NSArray *)forecast
       forecastConditions:(NSArray *)forecastConditions
{
    self = [super init];
    if (self) {
        self.weatherCurrentTemp = currentTemp;
        self.weatherCurrentDay = currentDay;
        self.weatherForecast = forecast;
        self.weatherForecastConditions = forecastConditions;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.weatherCode forKey:@"weatherCode"];
    [encoder encodeObject:[NSNumber numberWithUnsignedInteger:self.indexForWeatherMap] forKey:@"indexForWeatherMap"];
    [encoder encodeObject:self.weatherCurrentDay forKey:@"weatherCurrentDay"];
    [encoder encodeObject:self.weatherCurrentTemp forKey:@"weatherCurrentTemp"];
    [encoder encodeObject:self.weatherCurrentTempImage forKey:@"weatherCurrentTempImage"];
    [encoder encodeObject:self.weatherForecast forKey:@"weatherForecast"];
    [encoder encodeObject:self.weatherForecastConditions forKey:@"weatherForecastConditions"];
    [encoder encodeObject:self.weatherForecastConditionsImages forKey:@"weatherForecastConditionsImages"];
    [encoder encodeObject:self.weatherHumidity forKey:@"weatherHumidity"];
    [encoder encodeObject:self.weatherPrecipitationAmount forKey:@"weatherPrecipitationAmount"];
    [encoder encodeObject:self.weatherWindSpeed forKey:@"weatherWindSpeed"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self.weatherCode = [decoder decodeObjectForKey:@"weatherCode"];
    self.indexForWeatherMap = [[decoder decodeObjectForKey:@"indexForWeatherMap"] intValue];
    self.weatherCurrentDay = [decoder decodeObjectForKey:@"weatherCurrentDay"];
    self.weatherCurrentTemp = [decoder decodeObjectForKey:@"weatherCurrentTemp"];
    self.weatherCurrentTempImage = [decoder decodeObjectForKey:@"weatherCurrentTempImage"];
    self.weatherForecast = [decoder decodeObjectForKey:@"weatherForecast"];
    self.weatherForecastConditions = [decoder decodeObjectForKey:@"weatherForecastConditions"];
    self.weatherForecastConditionsImages = [decoder decodeObjectForKey:@"weatherForecastConditionsImages"];
    self.weatherHumidity = [decoder decodeObjectForKey:@"weatherHumidity"];
    self.weatherPrecipitationAmount = [decoder decodeObjectForKey:@"weatherPrecipitationAmount"];
    self.weatherWindSpeed = [decoder decodeObjectForKey:@"weatherWindSpeed"];
    
    return self;
}

@end
