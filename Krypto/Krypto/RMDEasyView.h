//
//  RMDEasyView.h
//  Krypto
//
//  Created by Rachel Dorn on 10/22/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDEasyViewDelegate <NSObject>

@required
- (void)reset;
- (void)stopTimer;
- (void)returnToLobby;

@end

@interface RMDEasyView : UIView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *targetLabel;
@property (nonatomic, strong) NSArray *cardLabels;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UILabel *timerLabel;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UILabel *countdownLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *answerLabel;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, weak) id <RMDEasyViewDelegate> delegate;

@end
