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

- (void)setCards {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    self.kryptoView.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    NSArray *cards = [cardDict objectForKey:@"cards"];
    for (int i = 0; i < 6; i++) {
        UILabel *label = [self.kryptoView.cardLabels objectAtIndex:i];
        label.text = [NSString stringWithFormat:@"%@", [cards objectAtIndex:i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
