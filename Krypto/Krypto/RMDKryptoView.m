//
//  RMDKryptoView.m
//  Krypto
//
//  Created by Rachel Dorn on 10/14/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDKryptoView.h"

@implementation RMDKryptoView

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
        
        self.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.doneButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.doneButton addTarget:self.delegate action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
        [self.doneButton setTitle:@"Krypto!" forState:UIControlStateNormal];
        [self addSubview:self.doneButton];
    
        self.cardLabels = @[card1, card2, card3, card4, card5, card6];
    
        self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.resetButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.resetButton setTitle:@"Reset" forState:UIControlStateNormal];
        [self.resetButton addTarget:self.delegate action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.resetButton];
    
        UIStackView *bottomStack = [[UIStackView alloc] initWithArrangedSubviews:@[card1, card2, card3, card4, card5, card6]];
        bottomStack.translatesAutoresizingMaskIntoConstraints = NO;
        bottomStack.distribution = UIStackViewDistributionFillEqually;
        bottomStack.spacing = 20;
        [self addSubview:bottomStack];
    
        UIStackView *topStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.resetButton, self.targetLabel, self.countdownLabel]];
        topStack.translatesAutoresizingMaskIntoConstraints = NO;
        topStack.distribution = UIStackViewDistributionFillEqually;
        [self addSubview:topStack];
    
        UIStackView *outerStack = [[UIStackView alloc] initWithArrangedSubviews:@[topStack, bottomStack, self.doneButton]];
        outerStack.translatesAutoresizingMaskIntoConstraints = NO;
        outerStack.axis = UILayoutConstraintAxisVertical;
        outerStack.distribution = UIStackViewDistributionFillEqually;
        [self addSubview:outerStack];
    
        NSDictionary *views = @{@"stack": outerStack};
        NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[stack]-20-|"
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

@end
