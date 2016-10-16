//
//  RMDKryptoViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 10/10/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDKryptoViewController.h"
#import "RMDKryptoDeck.h"
#import "RMDKryptoView.h"

@interface RMDKryptoViewController ()

@property (nonatomic, strong) RMDKryptoDeck *kryptoDeck;
@property (nonatomic, strong) RMDKryptoView *kryptoView;
@property (nonatomic) NSTimeInterval secondsElapsed;
@property (nonatomic, strong) NSTimer *secondsTimer;

@end

@implementation RMDKryptoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
    self.kryptoView = [[RMDKryptoView alloc] init];
    self.view = self.kryptoView;
}

- (void)viewWillAppear:(BOOL)animated {
    [self setCards];
}

- (void)viewDidAppear:(BOOL)animated {
    [self startTimer];
}

- (void)setCards {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    self.kryptoView.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    NSArray *cards = [cardDict objectForKey:@"cards"];
    for (int i = 0; i < 6; i++) {
        UILabel *label = [self.kryptoView.cardLabels objectAtIndex:i];
        label.text = [NSString stringWithFormat:@"%@", [cards objectAtIndex:i]];
    }
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
    self.kryptoView.countdownLabel.text = [self formatTime:self.secondsElapsed];
}

- (NSString *)formatTime:(int)totalSeconds {
    int hours = totalSeconds / 3600;
    int minutes = (totalSeconds / 60) % 60;
    int seconds = totalSeconds % 60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
