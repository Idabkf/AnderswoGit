//
//  ScreenTwentySevenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentySevenViewController.h"
//#import "RootViewController.h"

@interface ScreenTwentySevenViewController ()

@end

@implementation ScreenTwentySevenViewController

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
    //enable pageViews recognizer
}


 -(void) viewDidAppear:(BOOL)animated{
 [super viewDidAppear:animated];
 
 if (self.panEnabled) {
 //disable pageViews recognizer
 //[self.rootViewController disablePan];
 self.panEnabled = NO;
 }
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
