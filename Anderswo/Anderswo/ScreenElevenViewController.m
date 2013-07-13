//
//  ScreenElevenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 14.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenElevenViewController.h"
//#import "RootViewController.h"

@interface ScreenElevenViewController ()

@end

@implementation ScreenElevenViewController

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
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_groelm);
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen11-groelm" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(85.5f, 165.5f, image.size.width/2, image.size.height/2);
    //CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    imageView.frame = rect;
    [self.view addSubview:imageView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-Kind" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    imageView = [[UIImageView alloc] initWithImage:image];
    //CGRect rect = CGRectMake(367.25, 425.5, image.size.width/2, image.size.height/2);
    rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
    imageView.frame = rect;
    [self.view addSubview:imageView];
    
    //enable pageViews recognizer
    //[self.rootViewController enablePan];
    self.panEnabled = YES;
}

 -(void) viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     /* Weiterblättern immer möglich
     if (self.panEnabled) {
     //disable pageViews recognizer
     self.rootViewController disablePan];
     self.panEnabled = NO;
    }*/
     
     AudioServicesPlaySystemSound(_groelm);
 }
 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
