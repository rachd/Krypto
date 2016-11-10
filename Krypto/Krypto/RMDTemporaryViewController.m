//
//  RMDTemporaryViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 11/5/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDTemporaryViewController.h"
#import "RMDKryptoCollectionViewCell.h"

@interface RMDTemporaryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) UILabel *targetLabel;
@property (nonatomic, strong) NSArray *cardLabels;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UILabel *timerLabel;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UILabel *countdownLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *answerLabel;

@end

@implementation RMDTemporaryViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpCardCollection];
    [self setUpTarget];
}

- (void)setUpTarget {
    self.targetLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - self.view.frame.size.width / 7, self.view.frame.size.height / 3, self.view.frame.size.width / 7 - 10, self.view.frame.size.height / 3)];
    self.targetLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.targetLabel.textAlignment = NSTextAlignmentCenter;
    self.targetLabel.font = [UIFont systemFontOfSize:30];
    self.targetLabel.text = @"= 17";
    [self.view addSubview:self.targetLabel];
}

- (void)setUpCardCollection {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width / 7 - 10, self.view.frame.size.height / 3)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height / 3, (self.view.frame.size.width / 7) * 6 - 20, self.view.frame.size.height / 3) collectionViewLayout:flowLayout];
    
    [self.collection registerClass:[RMDKryptoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.view addSubview:self.collection];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 0.1;
    [self.collection addGestureRecognizer:longPress];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)selector {
    switch (selector.state) {
        case UIGestureRecognizerStateBegan:
            [self.collection beginInteractiveMovementForItemAtIndexPath:[self.collection indexPathForItemAtPoint:[selector locationInView:self.collection]]];
            break;
        case UIGestureRecognizerStateChanged:
            [self.collection updateInteractiveMovementTargetPosition:[selector locationInView:selector.view]];
            break;
        case UIGestureRecognizerStateEnded:
            [self.collection endInteractiveMovement];
            break;
        default:
            [self.collection cancelInteractiveMovement];
            break;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RMDKryptoCollectionViewCell *cell = (RMDKryptoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            if (true) {
                cell.label.text = @"Meow";
            }
            break;
        case 1:
            if (true) {
                cell.label.text = @"Hisssss";
            }
            break;
        default:
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
