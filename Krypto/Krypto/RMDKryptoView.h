//
//  RMDKryptoView.h
//  Krypto
//
//  Created by Rachel Dorn on 10/14/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDKryptoViewDelegate <NSObject>

@required
- (void)setCards;
- (void)stopTimer;

@end

@interface RMDKryptoView : UIView

@property (nonatomic, strong) UILabel *targetLabel;
@property (nonatomic, strong) NSArray *cardLabels;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UILabel *timerLabel;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UILabel *countdownLabel;
@property (nonatomic, weak) id <RMDKryptoViewDelegate> delegate;

@end
