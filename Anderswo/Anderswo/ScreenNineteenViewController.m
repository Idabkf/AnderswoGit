//
//  ScreenNineteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenNineteenViewController.h"
#import "RootViewController.h"

@interface ScreenNineteenViewController ()

@end

@implementation ScreenNineteenViewController

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
    
    [self initBackgroundMusic];
    [self initSounds];
    
    [self loadImages];
    
    //TEXT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen19" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    //[self animateStorm];
    [self removeGroelm];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //play music
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
    
    if (self.panEnabled) {
        //disable pageViews recognizer
        [self.rootViewController disablePan];
        self.panEnabled = NO;
    }
}

- (void) viewDidDisappear:(BOOL)animated{
    [_backgroundMusicPlayer stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initBackgroundMusic{
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Sandsturm" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    //AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_ambient);
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    [_backgroundMusicPlayer setDelegate:self];
    [_backgroundMusicPlayer setNumberOfLoops:-1];
}

-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_growl);
}

-(void) loadImages{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen19-Sandgroelm" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(-13.0f, 357.5f, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.groelmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.groelmView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen20-SandsturmA-BG" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.backgroundView.frame = rect;
    [self.backgroundView setUserInteractionEnabled:YES];
    [self.view addSubview:self.backgroundView];
    [self.backgroundView setHidden:YES];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen19-Sandkind" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.kindView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(216.0f, 227.5f, image.size.width/2, image.size.height/2);
    self.kindView.frame = rect;
    [self.kindView setUserInteractionEnabled:YES];
    [self.view addSubview:self.kindView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen19-Sandsturm" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.sturmView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.sturmView.frame = rect;
    [self.sturmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.sturmView];
    
    
    
}

-(void) animateStorm{
    self.sturmView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 4.0f, 0.0f);
    [UIImageView animateWithDuration:1.0
                               delay:0.0
                             options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                          animations:^{
                              [UIView setAnimationRepeatCount:5];
                              self.sturmView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -4.0f, 0.0f);
                          }completion:^(BOOL finished){
                             self.sturmView.transform = CGAffineTransformIdentity;
                          }];
}

- (void) removeGroelm{
    AudioServicesPlaySystemSound(_growl);
    AudioServicesPlaySystemSound(_growl);
    [UIImageView animateWithDuration:15.0
                               delay:3.0
                             options:nil
                          animations:^{
                              self.groelmView.alpha = 0.0f;
                              self.groelmView.transform = CGAffineTransformMakeScale(0.4f, 0.4f);
                          }completion:^(BOOL finished){
                              [self.groelmView removeFromSuperview];
                              //GestureRecognizer Tap
                              UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
                              recognizer.delegate = self;
                              [self.view addGestureRecognizer:recognizer];
                          }];
    
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen19a" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    [self.textView setImage:image];
    
    
    [self.backgroundView setHidden:NO];
    //enable pageViews recognizer
    [self.rootViewController enablePan];
    self.panEnabled = YES;
}

@end
