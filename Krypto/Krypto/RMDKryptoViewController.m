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

@end

@implementation RMDKryptoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.kryptoDeck = [[RMDKryptoDeck alloc] init];
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
