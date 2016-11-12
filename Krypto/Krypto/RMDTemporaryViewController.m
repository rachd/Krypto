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

@interface RMDTemporaryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource>

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
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic) NSTimeInterval secondsElapsed;
@property (nonatomic, strong) NSTimer *secondsTimer;
@property (nonatomic, strong) UIPickerView *operation1;
@property (nonatomic, strong) NSArray *operationsArray;

@end

@implementation RMDTemporaryViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
    [self setUpCardCollection];
    [self setUpAnswer];
    [self setUpTopRow];
    [self setUpBottomRow];
    [self setUpOperationsRow];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setCards];
    [self.collection reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [self startTimer];
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
    self.collection.backgroundColor = [UIColor cyanColor];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.view addSubview:self.collection];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 0.1;
    [self.collection addGestureRecognizer:longPress];
}

- (void)setCards {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    self.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    NSArray *cardArray = [cardDict objectForKey:@"cards"];
    self.cards = [[NSMutableArray alloc] init];
    for (int i = 0; i < cardArray.count; i++) {
        [self.cards addObject:[NSNumber numberWithInteger:[[cardArray objectAtIndex:i] integerValue]]];
    }
    [self updateAnswer];
}

- (void)updateAnswer {
    NSInteger total = [[self.cards objectAtIndex:0] integerValue];
    NSLog(@"%ld", (long)total);
    for (int i = 0; i < self.operationsArray.count; i++) {
        NSString *operation = [self.operationsArray objectAtIndex:i];
        if ([operation isEqualToString:@"+"]) {
            total = total + [[self.cards objectAtIndex:(i + 1)] integerValue];
        } else if ([operation isEqualToString:@"-"]) {
            total = total - [[self.cards objectAtIndex:(i + 1)] integerValue];
        } else if ([operation isEqualToString:@"*"]) {
            total = total * [[self.cards objectAtIndex:(i + 1)] integerValue];
        } else {
            total = total / [[self.cards objectAtIndex:(i + 1)] integerValue];
        }
    }
    [self.answerLabel setText:[NSString stringWithFormat:@"= %ld", (long)total]];
}

- (void)setUpBottomRow {
    self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.doneButton.frame = CGRectMake(30, (self.view.frame.size.height / 3) * 2 + 20, self.view.frame.size.width - 60, self.view.frame.size.height / 3 - 40);
    [self.doneButton addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.doneButton setTitle:@"Krypto!" forState:UIControlStateNormal];
    [self.doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.doneButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.doneButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.doneButton.layer.borderWidth = 2.0;
    [self.view addSubview:self.doneButton];
}

- (void)setUpTopRow {
    self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.resetButton.frame = CGRectMake(0, 0, self.view.frame.size.width / 6, self.view.frame.size.height / 6);
    [self.resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [self.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.resetButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetButton];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(self.view.frame.size.width / 6, 0, self.view.frame.size.width / 6, self.view.frame.size.height / 6);
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(returnToLobby) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    self.targetLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3, 0, self.view.frame.size.width / 3, self.view.frame.size.height / 6)];
    self.targetLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.targetLabel.textAlignment = NSTextAlignmentCenter;
    self.targetLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:self.targetLabel];
    
    self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 3) * 2, 0, self.view.frame.size.width / 3, self.view.frame.size.height / 6)];
    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
    self.countdownLabel.font = [UIFont systemFontOfSize:30];
    self.countdownLabel.text = @"00:00:00";
    [self.view addSubview:self.countdownLabel];
}

- (void)setUpOperationsRow {
    self.operationsArray = @[@"+", @"+", @"-", @"+", @"+"];
    
    self.operation1 = [[UIPickerView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 - 20, self.view.frame.size.height / 6, 40, self.view.frame.size.height / 6)];
    self.operation1.delegate = self;
    self.operation1.dataSource = self;
    [self.view addSubview:self.operation1];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row) {
        case 0:
            return @"+";
            break;
        case 1:
            return @"-";
            break;
        case 2:
            return @"*";
            break;
        case 3:
            return @"/";
            break;
        default:
            return @"";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
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
    cell.label.text = [NSString stringWithFormat:@"%@", [self.cards objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSNumber *movedObject = [self.cards objectAtIndex:sourceIndexPath.row];
    [self.cards removeObjectAtIndex:sourceIndexPath.row];
    [self.cards insertObject:movedObject atIndex:destinationIndexPath.row];
    [self updateAnswer];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)reset {
    [self.secondsTimer invalidate];
    self.countdownLabel.text = @"00:00:00";
    self.secondsElapsed = 0;
    [self setCards];
    [self updateAnswer];
    [self startTimer];
    [self.collection reloadData];
}

- (void)startTimer {
    self.secondsTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                         target:self
                                                       selector:@selector(updateLabel)
                                                       userInfo:nil
                                                        repeats:YES];
}

- (void)stopTimer {
    [self.secondsTimer invalidate];
}

- (void)updateLabel {
    self.secondsElapsed ++;
    self.countdownLabel.text = [self formatTime:self.secondsElapsed];
}

- (NSString *)formatTime:(int)totalSeconds {
    int hours = totalSeconds / 3600;
    int minutes = (totalSeconds / 60) % 60;
    int seconds = totalSeconds % 60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

- (void)returnToLobby {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
