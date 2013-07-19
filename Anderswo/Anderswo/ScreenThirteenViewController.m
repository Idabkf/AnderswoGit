//
//  ScreenThirteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenThirteenViewController.h"
#import "RootViewController.h"

@interface ScreenThirteenViewController ()

@end

@implementation ScreenThirteenViewController

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
    //[self initBackgroundMusic];
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"U-Boot" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_groelm);
    
    //TEXT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen13" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    [self setFigures];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //play music
    //[_backgroundMusicPlayer prepareToPlay];
    //[_backgroundMusicPlayer play];
    if (self.panEnabled) {
        //disable pageViews recognizer
        //[self.rootViewController disablePan];
        self.panEnabled = NO;
    }
}
/*
- (void) viewDidDisappear:(BOOL)animated{
    [_backgroundMusicPlayer stop];
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void) initBackgroundMusic{
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Wasser Ambient" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    //AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_ambient);
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    [_backgroundMusicPlayer setDelegate:self];
    [_backgroundMusicPlayer setNumberOfLoops:-1];
}
*/
- (void)setFigures{
    //GROELM UBOOT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen13-UBoot" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(16.0f, 184.0f, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.groelmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.groelmView];
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognizer.delegate = self;
    [self.groelmView addGestureRecognizer:tapRecognizer];
    
    
    //WATER
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen13-vorderesWasser" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.waterView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0,0, image.size.width/2, image.size.height/2);
    self.waterView.frame = rect;
    CGPoint point = CGPointMake(511.5f, 646.25f);
    [self.waterView setCenter:point];
    [self.waterView setUserInteractionEnabled:YES];
    [self.view addSubview:self.waterView];
     
    
    //CHILD
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen13-Kind-vIda" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.childView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(283.5f,488.0f, image.size.width/2, image.size.height/2);
    self.childView.frame = rect;
    [self.childView setUserInteractionEnabled:YES];
    [self.view addSubview:self.childView];
    
    //ORF
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen13-Chefwasserorf" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.orfView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(196.0f, -80.0f, image.size.width/2, image.size.height/2);
    self.orfView.frame = rect;
    [self.orfView setUserInteractionEnabled:YES];
    [self.groelmView addSubview:self.orfView];
    
    //TEXT 2
    pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen13-2" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.textView2 = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0,0, image.size.width/2, image.size.height/2);
    self.textView2.frame = rect;
    point = CGPointMake(679.75f, 691.0f);
    [self.textView2 setCenter:point];
    [self.view addSubview:self.textView2];
    
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    
    AudioServicesPlaySystemSound(_groelm);
    
    [self.childView removeFromSuperview];
    
    [UIImageView animateWithDuration:6.0
                               delay:0.0
                             options: UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              CGRect rect = CGRectMake(738.0f, 800.0f, self.groelmView.frame.size.width, self.groelmView.frame.size.height);
                              self.groelmView.frame = rect;
                          }completion:^(BOOL finished){
                              [self.view removeGestureRecognizer:recognizer];
                              NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen13a" ofType:@"png"];
                              UIImage *image = [UIImage imageWithContentsOfFile:pathString];
                              [self.textView setImage:image];
                              [self.textView2 setHidden:YES];
                              //enable pageViews recognizer
                              [self.rootViewController enablePan];
                              //[self loadLambsEar];
                              self.panEnabled = YES;
                          }];
    
}


@end
