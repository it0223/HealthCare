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
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.6:9292/healths"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *res, NSData *data, NSError *error){
//        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//        self.responsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSError *parseError = nil;
        self.healths = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        if (parseError) {
            NSLog(@"Error: %@", parseError);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
 // Do any additional setup after loading the view, typically from a nib.
}

  - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.healths.count;
} 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat:responsString];
    NSDictionary *dictionary = (NSDictionary*)self.healths[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"string %li %@", indexPath.row, dictionary[@"weight"]];
    cell.detailTextLabel.text = @"detail";
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
