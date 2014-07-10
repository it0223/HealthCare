//
//  USRNewHealthTableViewController.m
//  HealthCare
//
//  Created by endo on 2014/07/10.
//  Copyright (c) 2014年 UserLocal,Inc. All rights reserved.
//

#import "USRNewHealthTableViewController.h"

@interface USRNewHealthTableViewController ()

@end

@implementation USRNewHealthTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)didTapCancelButton:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

@end
