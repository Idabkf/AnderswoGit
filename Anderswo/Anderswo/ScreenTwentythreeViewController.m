//
//  ScreenTwentythreeViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentythreeViewController.h"
//#import "RootViewController.h"

@interface ScreenTwentythreeViewController ()

@end

@implementation ScreenTwentythreeViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_tada);
    AudioServicesPlaySystemSound(_tada);
    
    //TEXT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen23" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen23-FLASCHE" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.bottleView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.bottleView.frame = rect;
    CGPoint point = CGPointMake(512, 384.0f);
    [self.bottleView setCenter:point];
    [self.view addSubview:self.bottleView];
    
    [UIImageView animateWithDuration:2.0
                               delay:0.0
                             options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              self.bottleView.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
                          }completion:^(BOOL finished){
                              self.bottleView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                          }];
    
    
}

 -(void) viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     
     //enable pageViews recognizer
     //[self.rootViewController enablePan];
     self.panEnabled = YES;
     
     /*
      if (self.panEnabled) {
      //disable pageViews recognizer
      [self.rootViewController disablePan];
      self.panEnabled = NO;
      }*/
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
