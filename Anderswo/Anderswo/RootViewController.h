//
//  RootViewController.h
//  Anderswo
//
//  Created by Ida Buchwald on 14.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenViewController.h"

@interface RootViewController : UIViewController

@property ScreenViewController *currentScreen;

@property UIViewController *curlController;

@property UIImageView *lambsear;
@property UIImageView *lambsearLeft;

-(void) enablePan;
-(void)handleNextTap:(UITapGestureRecognizer *) recognizer;

@end
