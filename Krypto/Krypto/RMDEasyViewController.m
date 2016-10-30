//
//  RMDEasyViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 10/22/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDEasyViewController.h"
#import "RMDKryptoDeck.h"
#import "RMDEasyView.h"

@interface RMDEasyViewController ()

@property (nonatomic, strong) RMDKryptoDeck *kryptoDeck;
@property (nonatomic, strong) RMDEasyView *easyView;
@property (nonatomic) NSTimeInterval secondsElapsed;
@property (nonatomic, strong) NSTimer *secondsTimer;
@property (nonatomic, strong) NSArray *cards;

@end

@implementation RMDEasyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
    self.easyView = [[RMDEasyView alloc] init];
    self.view = self.easyView;
}

- (void)viewWillAppear:(BOOL)animated {
    [self setCards];
    [self updateAnswer];
}

- (void)viewDidAppear:(BOOL)animated {
    [self startTimer];
}

- (void)setCards {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    self.easyView.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    self.cards = [cardDict objectForKey:@"cards"];
    for (int i = 0; i < 6; i++) {
        UILabel *label = [self.easyView.cardLabels objectAtIndex:i];
        label.text = [NSString stringWithFormat:@"%@", [self.cards objectAtIndex:i]];
    }
}

- (void)updateAnswer {
    int sum = 0;
    for (int i = 0; i < 6; i++) {
        sum = sum + [[self.cards objectAtIndex:i] intValue];
    }
    NSLog(@"sum %i", sum);
    self.easyView.answerLabel.text = [NSString stringWithFormat:@"%i", sum];
}

- (void)reset {
    [self.secondsTimer invalidate];
    self.easyView.countdownLabel.text = @"00:00:00";
    self.secondsElapsed = 0;
    [self setCards];
    [self updateAnswer];
    [self startTimer];
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
    self.easyView.countdownLabel.text = [self formatTime:self.secondsElapsed];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
