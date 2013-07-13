//
//  ScreenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
#import "RootViewController.h"

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
    CGRect bounds = CGRectMake(0.0f, 0.0f, 1536.0f, 2048.0f);
    [self.view setBounds:bounds];
    self.panEnabled = YES;
    //NSLog(@"BOUNDS X: %f Y: %f", self.view.bounds.size.width, self.view.bounds.size.height);
    
    //GestureRecognizer Pan
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleEmergencyTap:)];
    recognizer.delegate = self;
    [recognizer setNumberOfTouchesRequired:4];
    [self.view addGestureRecognizer:recognizer];
   
}

-(void) viewWillDisappear:(BOOL)animated{
    [self.lambsear removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handleEmergencyTap:(UILongPressGestureRecognizer *) recognizer{
    [self.rootViewController enablePan];
    self.panEnabled = YES;
}



@end
