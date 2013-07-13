//
//  ScreenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
//#import "RootViewController.h"
#import "AppDelegate.h"
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
    //[self.rootViewController enablePan];
    self.panEnabled = YES;
}

-(void) loadLambsEar{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Eselsohr2_959k5_708k5" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.lambsear = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.lambsear.frame = rect;
    CGPoint point = CGPointMake(959.5f, 708.5f);
    [self.lambsear setCenter:point];
    [self.lambsear setUserInteractionEnabled:YES];
    [self.view addSubview:self.lambsear];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleNextTap:)];
    tapRecognizer.delegate = self;
    [self.lambsear addGestureRecognizer:tapRecognizer];
}

-(void)handleNextTap:(UITapGestureRecognizer *) recognizer{
    [self.lambsear removeFromSuperview];
    
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    ScreenViewController *destination = [appDelegate.mc viewControllerAfterViewController:self];
    
    ScreenSegue *segue = [[ScreenSegue alloc] initWithIdentifier:@"nextScreen" source:self destination:destination];
    [segue perform];
}

@end
