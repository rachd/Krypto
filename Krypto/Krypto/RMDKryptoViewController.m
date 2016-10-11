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
@property (nonatomic, strong) UILabel *card1;
@property (nonatomic, strong) UILabel *card2;
@property (nonatomic, strong) UILabel *card3;
@property (nonatomic, strong) UILabel *card4;
@property (nonatomic, strong) UILabel *card5;
@property (nonatomic, strong) UILabel *card6;

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
    [self.view addSubview:self.targetLabel];
    
    self.card1 = [[UILabel alloc] init];
    self.card1.translatesAutoresizingMaskIntoConstraints = NO;
    self.card1.textAlignment = NSTextAlignmentCenter;
    self.card1.layer.borderColor = [UIColor blackColor].CGColor;
    self.card1.layer.borderWidth = 2.0;
    self.card1.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card1];
    
    self.card2 = [[UILabel alloc] init];
    self.card2.translatesAutoresizingMaskIntoConstraints = NO;
    self.card2.textAlignment = NSTextAlignmentCenter;
    self.card2.layer.borderColor = [UIColor blackColor].CGColor;
    self.card2.layer.borderWidth = 2.0;
    self.card2.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card2];
    
    self.card3 = [[UILabel alloc] init];
    self.card3.translatesAutoresizingMaskIntoConstraints = NO;
    self.card3.textAlignment = NSTextAlignmentCenter;
    self.card3.layer.borderColor = [UIColor blackColor].CGColor;
    self.card3.layer.borderWidth = 2.0;
    self.card3.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card3];
    
    self.card4 = [[UILabel alloc] init];
    self.card4.translatesAutoresizingMaskIntoConstraints = NO;
    self.card4.textAlignment = NSTextAlignmentCenter;
    self.card4.layer.borderColor = [UIColor blackColor].CGColor;
    self.card4.layer.borderWidth = 2.0;
    self.card4.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card4];
    
    self.card5 = [[UILabel alloc] init];
    self.card5.translatesAutoresizingMaskIntoConstraints = NO;
    self.card5.textAlignment = NSTextAlignmentCenter;
    self.card5.layer.borderColor = [UIColor blackColor].CGColor;
    self.card5.layer.borderWidth = 2.0;
    self.card5.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card5];
    
    self.card6 = [[UILabel alloc] init];
    self.card6.translatesAutoresizingMaskIntoConstraints = NO;
    self.card6.textAlignment = NSTextAlignmentCenter;
    self.card6.layer.borderColor = [UIColor blackColor].CGColor;
    self.card6.layer.borderWidth = 2.0;
    self.card6.layer.cornerRadius = 6.0;
    [self.view addSubview:self.card6];
    
    self.targetLabel.text = @"Target";
    self.card3.text = @"3";
    self.card2.text = @"2";
    self.card1.text = @"1";
    self.card5.text = @"5";
    self.card4.text = @"4";
    self.card6.text = @"6";
    
    
    UIStackView *innerStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.card1, self.card2, self.card3, self.card4, self.card5, self.card6]];
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
    NSDictionary *cards = [self.kryptoDeck pickCards];
    NSLog(@"%@", cards);
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
