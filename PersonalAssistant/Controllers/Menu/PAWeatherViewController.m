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

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *precipitationLabel;
@property (nonatomic, strong) UILabel *humidityLabel;
@property (nonatomic, strong) UILabel *windLabel;

@end

@implementation PAWeatherViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.weatherManager = [PAWeatherManager sharedManager];
    self.weatherManager.delegate = self;
    
    [self setWeatherForWeatherItem:self.weatherManager.currentWeatherItem];
    
    [self.view colorizeSubviews];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"close"]];
    
    self.containerView = [[UIView alloc] init];
    
    self.weatherImageView = [[UIImageView alloc] init];
    
    self.temperatureLabel = [[UILabel alloc] init];
    self.precipitationLabel = [[UILabel alloc] init];
    self.humidityLabel = [[UILabel alloc] init];
    self.windLabel = [[UILabel alloc] init];
    
    [self.containerView addSubview:self.weatherImageView];
    [self.containerView addSubview:self.temperatureLabel];
    [self.containerView addSubview:self.precipitationLabel];
    [self.containerView addSubview:self.humidityLabel];
    [self.containerView addSubview:self.windLabel];
    
    [self.view addSubview:self.containerView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    CGFloat padding = 10.f;
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(padding);
        make.right.equalTo(self.view).offset(-padding);
        make.height.equalTo(self.view).multipliedBy(0.5);
    }];
    
    [self.weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView).offset(padding);
        make.centerX.equalTo(self.containerView).multipliedBy(0.5);
        make.height.width.equalTo(self.containerView.mas_height).multipliedBy(0.5);
    }];
    
    [self.temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView).offset(padding);
        make.left.equalTo(self.weatherImageView.mas_right).offset(padding);
        make.right.equalTo(self.containerView).offset(-padding);
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
    self.temperatureLabel.text = item.weatherCurrentTemp;
    self.precipitationLabel.text = item.weatherPrecipitationAmount;
    self.humidityLabel.text = item.weatherHumidity;
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph", item.weatherWindSpeed];
    
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
