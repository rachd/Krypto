//
//  RMDHomeViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 10/19/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHomeViewController.h"
#import "RMDKryptoViewController.h"

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
}

- (void)startHardMode {
    RMDKryptoViewController *hardKrypto = [[RMDKryptoViewController alloc] init];
    [self presentViewController:hardKrypto animated:YES completion:nil];
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
