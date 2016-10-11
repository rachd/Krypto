//
//  RMDKryptoDeck.m
//  Krypto
//
//  Created by Rachel Dorn on 10/10/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDKryptoDeck.h"

@interface RMDKryptoDeck ()

@property (nonatomic, strong) NSArray *kryptoCards;

@end

@implementation RMDKryptoDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        self.kryptoCards = @[@1, @1, @1, @2, @2, @2, @3, @3, @3, @4, @4, @4, @5, @5, @5, @6, @6, @6, @7, @7, @7, @7, @8, @8, @8, @8, @9, @9, @9, @9, @10, @10, @10, @10, @11, @11, @12, @12, @13, @13, @14, @14, @15, @15, @16, @16, @17, @17, @18, @19, @20, @21, @22, @23, @24, @25];
    }
    return self;
}

@end
