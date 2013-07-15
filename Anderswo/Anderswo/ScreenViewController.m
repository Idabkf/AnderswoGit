//
//  ScreenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
#import "RootViewController.h"
#import "ScreenSegue.h"

@interface ScreenViewController ()

@end

@implementation ScreenViewController

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
    CGRect bounds = CGRectMake(0, 0, 768.0f, 1024.0f);
    [self.view setBounds:bounds];
    //self.wantsFullScreenLayout = YES;
    self.panEnabled = NO;
    //NSLog(@"BOUNDS X: %f Y: %f", self.view.bounds.size.width, self.view.bounds.size.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"MEMORY WARNING IN SCREEN %@", self.dataObject);
}



@end
