//
//  ScreenTwentysixViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentysixViewController.h"
//#import "RootViewController.h"

@interface ScreenTwentysixViewController ()

@end

@implementation ScreenTwentysixViewController

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
    
    //TEXT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen26" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    //enable pageViews recognizer
    //[self.rootViewController enablePan];
    self.panEnabled = YES;
}

/*
 -(void) viewDidAppear:(BOOL)animated{
 [super viewDidAppear:animated];
 
 if (self.panEnabled) {
 //disable pageViews recognizer
 [self.rootViewController disablePan];
 self.panEnabled = NO;
 }
 }
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
