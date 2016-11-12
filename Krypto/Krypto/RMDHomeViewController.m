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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
