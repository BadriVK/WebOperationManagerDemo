//
//  AppDelegate.h
//  WebOperationManager
//
//  Created by Arpit Vishwakarma on 01/02/16.
//  Copyright © 2016 Arpit Vishwakarma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(BOOL)isNetworkAvailable;

@end

