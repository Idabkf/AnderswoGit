//
//  AppDelegate.h
//  Anderswo
//
//  Created by Ida Buchwald on 13.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestFlight.h"
#import "ModelController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property ModelController *mc;

@end
