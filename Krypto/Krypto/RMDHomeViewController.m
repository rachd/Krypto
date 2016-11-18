//
//  RMDHomeViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 10/19/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHomeViewController.h"
#import "RMDKryptoViewController.h"
#import "RMDEasyViewController.h"
#import "RMDTemporaryViewController.h"
#import "RMDRulesViewController.h"

@interface RMDHomeViewController ()

@end

@implementation RMDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *hardMode = [UIButton buttonWithType:UIButtonTypeSystem];
    [hardMode setTitle:@"Hard Mode" forState:UIControlStateNormal];
    hardMode.frame = CGRectMake(20, self.view.frame.size.height / 4, self.view.frame.size.width - 40, 40);
    [hardMode addTarget:self action:@selector(startHardMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hardMode];
    
    UIButton *easyMode = [UIButton buttonWithType:UIButtonTypeSystem];
    [easyMode setTitle:@"Easy Mode" forState:UIControlStateNormal];
    easyMode.frame = CGRectMake(20, self.view.frame.size.height / 2, self.view.frame.size.width - 40, 40);
    [easyMode addTarget:self action:@selector(startEasyMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:easyMode];
    
    UIButton *rulesButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    rulesButton.frame = CGRectMake(self.view.frame.size.width - 60, 20, 40, 40);
    [rulesButton addTarget:self action:@selector(openRules) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rulesButton];
}

- (void)startHardMode {
    RMDKryptoViewController *hardKrypto = [[RMDKryptoViewController alloc] init];
    [self presentViewController:hardKrypto animated:YES completion:nil];
}

- (void)startEasyMode {
    //RMDEasyViewController *easyKrypto = [[RMDEasyViewController alloc] init];
    RMDTemporaryViewController *easyKrypto = [[RMDTemporaryViewController alloc] init];
    [self presentViewController:easyKrypto animated:YES completion:nil];
}

- (void)openRules {
    RMDRulesViewController *rulesVC = [[RMDRulesViewController alloc] init];
    [self presentViewController:rulesVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
