//
//  RMDEasyView.m
//  Krypto
//
//  Created by Rachel Dorn on 10/22/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDEasyView.h"
#import "RMDKryptoCollectionViewCell.h"

@implementation RMDEasyView

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        
        self.targetLabel = [[UILabel alloc] init];
        self.targetLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.targetLabel.textAlignment = NSTextAlignmentCenter;
        self.targetLabel.font = [UIFont systemFontOfSize:40];
        [self addSubview:self.targetLabel];
        
        UILabel *card1 = [[UILabel alloc] init];
        card1.translatesAutoresizingMaskIntoConstraints = NO;
        card1.textAlignment = NSTextAlignmentCenter;
        card1.layer.borderColor = [UIColor blackColor].CGColor;
        card1.layer.borderWidth = 2.0;
        card1.layer.cornerRadius = 6.0;
        card1.font = [UIFont systemFontOfSize:40];
        [self addSubview:card1];
        
        UILabel *card2 = [[UILabel alloc] init];
        card2.translatesAutoresizingMaskIntoConstraints = NO;
        card2.textAlignment = NSTextAlignmentCenter;
        card2.layer.borderColor = [UIColor blackColor].CGColor;
        card2.layer.borderWidth = 2.0;
        card2.layer.cornerRadius = 6.0;
        card2.font = [UIFont systemFontOfSize:40];
        [self addSubview:card2];
        
        UILabel *card3 = [[UILabel alloc] init];
        card3.translatesAutoresizingMaskIntoConstraints = NO;
        card3.textAlignment = NSTextAlignmentCenter;
        card3.layer.borderColor = [UIColor blackColor].CGColor;
        card3.layer.borderWidth = 2.0;
        card3.layer.cornerRadius = 6.0;
        card3.font = [UIFont systemFontOfSize:40];
        [self addSubview:card3];
        
        UILabel *card4 = [[UILabel alloc] init];
        card4.translatesAutoresizingMaskIntoConstraints = NO;
        card4.textAlignment = NSTextAlignmentCenter;
        card4.layer.borderColor = [UIColor blackColor].CGColor;
        card4.layer.borderWidth = 2.0;
        card4.layer.cornerRadius = 6.0;
        card4.font = [UIFont systemFontOfSize:40];
        [self addSubview:card4];
        
        UILabel *card5 = [[UILabel alloc] init];
        card5.translatesAutoresizingMaskIntoConstraints = NO;
        card5.textAlignment = NSTextAlignmentCenter;
        card5.layer.borderColor = [UIColor blackColor].CGColor;
        card5.layer.borderWidth = 2.0;
        card5.layer.cornerRadius = 6.0;
        card5.font = [UIFont systemFontOfSize:40];
        [self addSubview:card5];
        
        UILabel *card6 = [[UILabel alloc] init];
        card6.translatesAutoresizingMaskIntoConstraints = NO;
        card6.textAlignment = NSTextAlignmentCenter;
        card6.layer.borderColor = [UIColor blackColor].CGColor;
        card6.layer.borderWidth = 2.0;
        card6.layer.cornerRadius = 6.0;
        card6.font = [UIFont systemFontOfSize:40];
        [self addSubview:card6];
        
        self.countdownLabel = [[UILabel alloc] init];
        self.countdownLabel.textAlignment = NSTextAlignmentCenter;
        self.countdownLabel.font = [UIFont systemFontOfSize:30];
        self.countdownLabel.text = @"00:00:00";
        [self addSubview:self.countdownLabel];
        
        self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.doneButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.doneButton addTarget:self.delegate action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
        [self.doneButton setTitle:@"Krypto!" forState:UIControlStateNormal];
        [self.doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.doneButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        self.doneButton.layer.borderColor = [UIColor blueColor].CGColor;
        self.doneButton.layer.borderWidth = 2.0;
        [self addSubview:self.doneButton];
        
        self.cardLabels = @[card1, card2, card3, card4, card5, card6];
        
        self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.resetButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.resetButton setTitle:@"Reset" forState:UIControlStateNormal];
        [self.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.resetButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        //        self.resetButton.layer.borderColor = [UIColor whiteColor].CGColor;
        //        self.resetButton.layer.borderWidth = 2.0;
        [self.resetButton addTarget:self.delegate action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.resetButton];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
        [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.backButton addTarget:self.delegate action:@selector(returnToLobby) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backButton];
        
        self.answerLabel = [[UILabel alloc] init];
        self.answerLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.answerLabel.font = [UIFont systemFontOfSize:40];
        self.answerLabel.textColor = [UIColor blackColor];
        [self addSubview:self.answerLabel];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setItemSize:CGSizeMake(self.frame.size.width / 6 - 10, self.frame.size.height / 3)];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(10, self.frame.size.height / 3, self.frame.size.width - 20, self.frame.size.height / 3) collectionViewLayout:flowLayout];
        
        [self.collection registerClass:[RMDKryptoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        self.collection.backgroundColor = [UIColor whiteColor];
        self.collection.delegate = self;
        self.collection.dataSource = self;
        [self addSubview:self.collection];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPress.minimumPressDuration = 0.1;
        [self.collection addGestureRecognizer:longPress];
        
        UILabel *equals = [[UILabel alloc] init];
        equals.translatesAutoresizingMaskIntoConstraints = NO;
        equals.text = @"=";
        equals.font = [UIFont systemFontOfSize:40];
        equals.textColor = [UIColor blackColor];
        [self addSubview:equals];
        
        UIStackView *bottomStack = [[UIStackView alloc] initWithArrangedSubviews:@[card1, card2, card3, card4, card5, card6, equals, self.answerLabel]];
        bottomStack.translatesAutoresizingMaskIntoConstraints = NO;
        bottomStack.distribution = UIStackViewDistributionFillEqually;
        bottomStack.spacing = 20;
        [self addSubview:bottomStack];
        
        UIStackView *leftButtons = [[UIStackView alloc] initWithArrangedSubviews:@[self.backButton, self.resetButton]];
        leftButtons.translatesAutoresizingMaskIntoConstraints = NO;
        leftButtons.distribution = UIStackViewDistributionFillEqually;
        [self addSubview:leftButtons];
        
        UIStackView *topStack = [[UIStackView alloc] initWithArrangedSubviews:@[leftButtons, self.targetLabel, self.countdownLabel]];
        topStack.translatesAutoresizingMaskIntoConstraints = NO;
        topStack.distribution = UIStackViewDistributionFillEqually;
        [self addSubview:topStack];
        
        UIStackView *outerStack = [[UIStackView alloc] initWithArrangedSubviews:@[topStack, self.collection, self.doneButton]];
        outerStack.translatesAutoresizingMaskIntoConstraints = NO;
        outerStack.axis = UILayoutConstraintAxisVertical;
        outerStack.distribution = UIStackViewDistributionFillEqually;
        outerStack.spacing = 20;
        [self addSubview:outerStack];
        
        NSDictionary *views = @{@"stack": outerStack};
        NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[stack]-20-|"
                                                                options:0
                                                                metrics:nil
                                                                  views:views];
        NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[stack]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views];
        [self addConstraints:vert];
        [self addConstraints:horiz];
    }
    return self;
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

@end
