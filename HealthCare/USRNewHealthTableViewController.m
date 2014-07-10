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

- (IBAction)didTapSaveButton:(id)sender
{
    NSLog(@"%@", self.weightTextField.text);
    NSDictionary *parameters = @{@"weight": @(self.weightTextField.text.intValue)};
    
    NSError *error = nil;
    NSData *body = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    if (error != nil) {
        NSLog(@"Error: %@", error);
    }
    
    NSURL *url =[NSURL URLWithString:@"http://192.168.1.6:9292/healths"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%li", body.length] forHTTPHeaderField:@"Content-Length"];
    request.HTTPBody = body;
    
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
        NSLog(@"Error: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        dispatch_async(dispatch_get_main_queue(),^{
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        });
     }];
    
}

#pragma mark - Table view data source

@end
