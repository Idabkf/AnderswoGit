//
//  ScreenOneViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenOneViewController.h"
#import "RootViewController.h"

@interface ScreenOneViewController ()

@end

@implementation ScreenOneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   // NSLog(@"SCREEN SIZE : x:%@ y:%@", self.view.frame.size.width, self.view.frame.size.height);
    //enable pageViews recognizer
    [self.rootViewController enablePan];
    self.panEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
