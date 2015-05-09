//
//  PAMenuViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuViewController.h"

@interface PAMenuViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PAMenuViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.collectionView = [[UICollectionView alloc] init];
    
    if (self.navigationController) {
        
        // add app name 
    }
}

- (void)setupConstraints
{
    [super setupConstraints];
}

@end
