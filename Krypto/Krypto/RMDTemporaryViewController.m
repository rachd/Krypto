//
//  RMDTemporaryViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 11/5/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDTemporaryViewController.h"
#import "RMDKryptoCollectionViewCell.h"
#import "RMDKryptoDeck.h"

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
@property (nonatomic, strong) RMDKryptoDeck *kryptoDeck;
@property (nonatomic, strong) NSArray *cards;

@end

@implementation RMDTemporaryViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
    [self setUpCardCollection];
    [self setUpAnswer];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setCards];
    [self.collection reloadData];
}

- (void)setUpAnswer {
    self.answerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - self.view.frame.size.width / 7, self.view.frame.size.height / 3, self.view.frame.size.width / 7 - 10, self.view.frame.size.height / 3)];
    self.answerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerLabel.textAlignment = NSTextAlignmentCenter;
    self.answerLabel.font = [UIFont systemFontOfSize:30];
    self.answerLabel.text = @"= 17";
    [self.view addSubview:self.answerLabel];
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

- (void)setCards {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    NSLog(@"cardDict %@", cardDict);
    //self.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    self.cards = [cardDict objectForKey:@"cards"];
    [self.answerLabel setText:[NSString stringWithFormat:@"= %@", [self.cards valueForKeyPath:@"@sum.self"]]];
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
    NSLog(@"%@", [NSString stringWithFormat:@"%@", [self.cards objectAtIndex:indexPath.row]]);
    cell.label.text = [NSString stringWithFormat:@"%@", [self.cards objectAtIndex:indexPath.row]];
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
