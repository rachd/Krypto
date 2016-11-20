//
//  RMDRulesViewController.m
//  Krypto
//
//  Created by Rachel Dorn on 11/17/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRulesViewController.h"

@interface RMDRulesViewController ()

@end

@implementation RMDRulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 65, 10, 50, 64)];
    [closeButton addTarget:self action:@selector(closeRules) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.view addSubview:closeButton];
    
    UIButton *creditsLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    [creditsLabel setTitle:@"Delete icon credits" forState:UIControlStateNormal];
    [creditsLabel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    creditsLabel.frame = CGRectMake(self.view.frame.size.width - 100, self.view.frame.size.height - 20, 100, 20);
    creditsLabel.titleLabel.font = [UIFont systemFontOfSize:10];
    [creditsLabel addTarget:self action:@selector(openCredits) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:creditsLabel];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    title.text = @"Rules to Kypto";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:title];
    
    UILabel *rules = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    rules.text = @"The objective of Krypto is to reach the target card's value by applying the four basic arithmetic operations (addition, subtraction, multiplication, and division) to the six playable cards. These cards can be used in any order.";
    rules.textAlignment = NSTextAlignmentLeft;
    rules.textColor = [UIColor blackColor];
    rules.font = [UIFont systemFontOfSize:14];
    rules.numberOfLines = 0;
    [self.view addSubview:rules];
}

- (void)openCredits {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://icons8.com/web-app/46/Delete"]];

}

- (void)closeRules {
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
