//
//  ViewController.m
//  WebOperationManager
//
//  Created by Arpit Vishwakarma on 01/02/16.
//  Copyright © 2016 Arpit Vishwakarma. All rights reserved.
//

#import "ViewController.h"
#import "WebServiceOperation.h"
#import "Reachability.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate  = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    if ([appDelegate isNetworkAvailable]) {
        
        NSDictionary *params = @{@"first_name":@"",
                                 @"last_name": @"",
                                 };
        
        WebServiceOperation *webOperation = [[WebServiceOperation alloc]init];
        [webOperation performWebOperationOnServer:@"YOURURL" withParameters:params withCallback:^(NSDictionary *response) {
            
        }];

    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
