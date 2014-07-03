//
//  USRViewController.m
//  HealthCare
//
//  Created by endo on 2014/07/03.
//  Copyright (c) 2014年 UserLocal,Inc. All rights reserved.
//

#import "USRViewController.h"

@interface USRViewController ()

@end

@implementation USRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
}

  - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
} 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Sample"];
    cell.detailTextLabel.text = @"detail";
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
