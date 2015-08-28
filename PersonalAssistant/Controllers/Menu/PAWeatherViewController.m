//
//  PAWeatherViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWeatherViewController.h"
#import "PAWeatherManager.h"

@interface PAWeatherViewController () <PAWeatherManagerDelegate>

@property (nonatomic, strong) PAWeatherManager *weatherManager;
@property (nonatomic, strong) PAWeatherItem *currentWeatherItem;

@property (nonatomic, strong) UIImageView *weatherImageView;

@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *precipitationLabel;
@property (nonatomic, strong) UILabel *humidityLabel;
@property (nonatomic, strong) UILabel *windLabel;

@property (nonatomic, strong) UIView *labelContainerView;

@end

@implementation PAWeatherViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.weatherManager = [PAWeatherManager sharedManager];
    self.weatherManager.delegate = self;
    
    [self setWeatherForWeatherItem:self.weatherManager.currentWeatherItem];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"close"]];
    
    self.weatherImageView = [[UIImageView alloc] init];
    
    self.temperatureLabel = [[UILabel alloc] init];
    self.precipitationLabel = [[UILabel alloc] init];
    self.humidityLabel = [[UILabel alloc] init];
    self.windLabel = [[UILabel alloc] init];
    
    self.labelContainerView = [[UIView alloc] init];
    
    [self.labelContainerView addSubview:self.temperatureLabel];
    [self.labelContainerView addSubview:self.precipitationLabel];
    [self.labelContainerView addSubview:self.humidityLabel];
    [self.labelContainerView addSubview:self.windLabel];
    
    [self.contentView addSubview:self.weatherImageView];
    [self.contentView addSubview:self.labelContainerView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    CGFloat padding = 10.f;
    
    [self.weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(padding * 4);
        make.centerX.equalTo(self.contentView).multipliedBy(0.5);
        make.height.width.equalTo(self.contentView.mas_height).multipliedBy(0.4);
    }];
    
    [self.labelContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.weatherImageView);
        make.left.equalTo(self.weatherImageView.mas_right).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
        make.top.equalTo(self.temperatureLabel);
        make.bottom.equalTo(self.windLabel);
    }];
    
    [self.temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelContainerView);
        make.left.equalTo(self.weatherImageView.mas_right).offset(padding);
        make.right.equalTo(self.labelContainerView).offset(-padding);
    }];
    
    [self.precipitationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.temperatureLabel);
        make.top.equalTo(self.temperatureLabel.mas_bottom).offset(padding * 0.5f);
    }];
    
    [self.humidityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.temperatureLabel);
        make.top.equalTo(self.precipitationLabel.mas_bottom).offset(padding * 0.5f);
    }];
    
    [self.windLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.temperatureLabel);
        make.top.equalTo(self.humidityLabel.mas_bottom).offset(padding * 0.5f);
    }];
}

#pragma mark - Methods

- (void)setWeatherForWeatherItem:(PAWeatherItem *)item
{
    self.weatherImageView.image = item.weatherCurrentTempImage;
    self.temperatureLabel.text = [NSString stringWithFormat:@"Temperature : %@",item.weatherCurrentTemp];
    self.precipitationLabel.text = [NSString stringWithFormat:@"Precipitation : %@",item.weatherPrecipitationAmount];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity : %@", item.weatherHumidity];
    self.windLabel.text = [NSString stringWithFormat:@"Wind : %@ mph", item.weatherWindSpeed];

    [self.view layoutSubviews];
}

#pragma mark - Button Actions 

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PAWeatherManagerDelegate methods

- (void)didRecieveAndParseNewWeatherItem:(PAWeatherItem *)item
{
    [self setWeatherForWeatherItem:item];
}

@end
