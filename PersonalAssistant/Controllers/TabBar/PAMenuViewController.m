//
//  PAMenuViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuViewController.h"
#import "PAMenuBar.h"
#import "PAMenuCollectionViewCell.h"
#import "PAMenuCellViewFactory.h"

@interface PAMenuViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) PAMenuBar *menuBar;

@end

@implementation PAMenuViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    if (self.navigationController) {
        [self addNavigationBarLeftTitle];
    }
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.minimumLineSpacing = 10.0f;
    flowLayout.headerReferenceSize = CGSizeZero;
    flowLayout.footerReferenceSize = CGSizeZero;
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView= [[UICollectionView alloc] initWithFrame:CGRectZero
                                            collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
    [self.collectionView registerClass:[PAMenuCollectionViewCell class]
            forCellWithReuseIdentifier:[PAMenuCollectionViewCell reuseIdentifier]];
    
    self.menuBar = [[PAMenuBar alloc] init];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.menuBar];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.menuBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-30);
        make.width.equalTo(self.view);
        make.height.equalTo(@310);
    }];
}

- (void)addNavigationBarLeftTitle
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.userInteractionEnabled = NO;
 
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.text = APP_NAME;
    
    CGFloat width = [tempLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, 64)].width;
    
    leftButton.bounds = CGRectMake(0, 0, width + 15, 30);
    [leftButton setTitle:APP_NAME forState:UIControlStateNormal];
    leftButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    leftButton.titleLabel.textColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -6;
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, leftItem, nil]
                                      animated:NO];
}

#pragma mark - UICollectionViewDatasource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PAMenuCollectionViewCell reuseIdentifier]
                                                                               forIndexPath:indexPath];
    [cell setTitle:[PAMenuCellViewFactory itemNameForIndex:indexPath.row]];
    [cell setImage:[PAMenuCellViewFactory itemImageForIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(145, 150);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SEL typeSelector = NSSelectorFromString([PAMenuCellViewFactory selectorNameForItemAtIndex:indexPath.row]);
    
    if ([self respondsToSelector:typeSelector]) {
        [self performSelector:typeSelector withObject:nil];
    }
}

#pragma mark - MenuCellAction methods

- (void)onSendMessageClick
{
    NSLog(@"onSendMessageClick");
}

- (void)onCallNumberClick
{
    NSLog(@"onCallNumberClick");
}

- (void)onSendEmailClick
{
    NSLog(@"onSendEmailClick");
}

- (void)onFindPlacesClick
{
    NSLog(@"onFindPlacesClick");
}

- (void)onWeatherClick
{
    NSLog(@"onWeatherClick");
}

- (void)onRemindersClick
{
    NSLog(@"onRemindersClick");
}

- (void)onTwitterClick
{
    NSLog(@"onTwitterClick");
}

- (void)onFacebookClick
{
    NSLog(@"onFacebookClick");
}

- (void)onSurfClick
{
    NSLog(@"onSurfClick");
}

@end
