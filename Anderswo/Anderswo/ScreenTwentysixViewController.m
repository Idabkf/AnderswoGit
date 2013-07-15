//
//  ScreenTwentysixViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentysixViewController.h"
#import "RootViewController.h"

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
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen04aa-Groelmdrohend" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0,0, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    CGPoint point = CGPointMake(559.5,478.75);
    [self.groelmView setCenter:point];
    [self.view addSubview:self.groelmView];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
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

- (void) handleTap:(UITapGestureRecognizer *)recognizer{
    //AudioServicesPlaySystemSound(_growl);
    [UIImageView animateWithDuration:10.0
                               delay:0.0
                             options:nil
                          animations:^{
                              self.groelmView.alpha = 0.0f;
                              self.groelmView.transform = CGAffineTransformMakeScale(0.4f, 0.4f);
                          }completion:^(BOOL finished){
                              [self.groelmView removeFromSuperview];
                              //enable pageViews recognizer
                              [self.rootViewController enablePan];
                              //[self loadLambsEar];
                              self.panEnabled = YES;
                          }];
    
}

@end
