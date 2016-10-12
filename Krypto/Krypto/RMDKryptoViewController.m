//
//  RMDKryptoViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 10/10/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDKryptoViewController.h"
#import "RMDKryptoDeck.h"

@interface RMDKryptoViewController ()

@property (nonatomic, strong) RMDKryptoDeck *kryptoDeck;
@property (nonatomic, strong) UILabel *targetLabel;
@property (nonatomic, strong) NSArray *cardLabels;

@end

@implementation RMDKryptoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
    [self setUpElements];
}

- (void)setUpElements {
    self.targetLabel = [[UILabel alloc] init];
    self.targetLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.targetLabel.textAlignment = NSTextAlignmentCenter;
    self.targetLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:self.targetLabel];
    
    UILabel *card1 = [[UILabel alloc] init];
    card1.translatesAutoresizingMaskIntoConstraints = NO;
    card1.textAlignment = NSTextAlignmentCenter;
    card1.layer.borderColor = [UIColor blackColor].CGColor;
    card1.layer.borderWidth = 2.0;
    card1.layer.cornerRadius = 6.0;
    card1.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card1];
    
    UILabel *card2 = [[UILabel alloc] init];
    card2.translatesAutoresizingMaskIntoConstraints = NO;
    card2.textAlignment = NSTextAlignmentCenter;
    card2.layer.borderColor = [UIColor blackColor].CGColor;
    card2.layer.borderWidth = 2.0;
    card2.layer.cornerRadius = 6.0;
    card2.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card2];
    
    UILabel *card3 = [[UILabel alloc] init];
    card3.translatesAutoresizingMaskIntoConstraints = NO;
    card3.textAlignment = NSTextAlignmentCenter;
    card3.layer.borderColor = [UIColor blackColor].CGColor;
    card3.layer.borderWidth = 2.0;
    card3.layer.cornerRadius = 6.0;
    card3.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card3];
    
    UILabel *card4 = [[UILabel alloc] init];
    card4.translatesAutoresizingMaskIntoConstraints = NO;
    card4.textAlignment = NSTextAlignmentCenter;
    card4.layer.borderColor = [UIColor blackColor].CGColor;
    card4.layer.borderWidth = 2.0;
    card4.layer.cornerRadius = 6.0;
    card4.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card4];
    
    UILabel *card5 = [[UILabel alloc] init];
    card5.translatesAutoresizingMaskIntoConstraints = NO;
    card5.textAlignment = NSTextAlignmentCenter;
    card5.layer.borderColor = [UIColor blackColor].CGColor;
    card5.layer.borderWidth = 2.0;
    card5.layer.cornerRadius = 6.0;
    card5.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card5];
    
    UILabel *card6 = [[UILabel alloc] init];
    card6.translatesAutoresizingMaskIntoConstraints = NO;
    card6.textAlignment = NSTextAlignmentCenter;
    card6.layer.borderColor = [UIColor blackColor].CGColor;
    card6.layer.borderWidth = 2.0;
    card6.layer.cornerRadius = 6.0;
    card6.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:card6];
    
    self.cardLabels = @[card1, card2, card3, card4, card5, card6];
    
    card1.text = @"1";
    card2.text = @"2";
    card3.text = @"3";
    card4.text = @"4";
    card5.text = @"5";
    card6.text = @"6";
    
    
    UIStackView *innerStack = [[UIStackView alloc] initWithArrangedSubviews:@[card1, card2, card3, card4, card5, card6]];
    innerStack.translatesAutoresizingMaskIntoConstraints = NO;
    innerStack.distribution = UIStackViewDistributionFillEqually;
    innerStack.spacing = 20;
    [self.view addSubview:innerStack];
    
    UIStackView *outerStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.targetLabel, innerStack]];
    outerStack.translatesAutoresizingMaskIntoConstraints = NO;
    outerStack.axis = UILayoutConstraintAxisVertical;
    outerStack.distribution = UIStackViewDistributionFillEqually;
    [self.view addSubview:outerStack];
    
    NSDictionary *views = @{@"stack": outerStack};
    NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[stack]-20-|"
                                                            options:0
                                                            metrics:nil
                                                              views:views];
    NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[stack]-|"
                                                             options:0
                                                             metrics:nil
                                                               views:views];
    [self.view addConstraints:vert];
    [self.view addConstraints:horiz];
}

- (void)viewWillAppear:(BOOL)animated {
    NSDictionary *cardDict = [self.kryptoDeck pickCards];
    self.targetLabel.text = [NSString stringWithFormat:@"%@", [cardDict objectForKey:@"target"]];
    NSArray *cards = [cardDict objectForKey:@"cards"];
    NSLog(@"%@", cards);
    for (int i = 0; i < 6; i++) {
        UILabel *label = [self.cardLabels objectAtIndex:i];
        label.text = [NSString stringWithFormat:@"%@", [cards objectAtIndex:i]];
    }
    
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
