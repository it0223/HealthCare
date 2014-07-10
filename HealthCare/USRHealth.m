//
//  USRHealth.m
//  HealthCare
//
//  Created by endo on 2014/07/10.
//  Copyright (c) 2014年 UserLocal,Inc. All rights reserved.
//

#import "USRHealth.h"

@implementation USRHealth

- (instancetype)initWithWeight:(NSNumber *)weight
{
    self = [super init];
    if (self) {
        self.weight = weight;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithWeight:@0];
}

@end
