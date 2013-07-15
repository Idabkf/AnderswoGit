//
//  ScreenTwelveViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwelveViewController.h"
#import "RootViewController.h"

@interface ScreenTwelveViewController ()

@end

@implementation ScreenTwelveViewController

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
    [self initSounds];
    
    //TEXT
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen12" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen11-groelm" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(85.5f, 165.5f, image.size.width/2, image.size.height/2);
    //CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.view addSubview:self.groelmView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-Kind" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.kindView = [[UIImageView alloc] initWithImage:image];
    //CGRect rect = CGRectMake(367.25, 425.5, image.size.width/2, image.size.height/2);
    rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
    self.kindView.frame = rect;
    [self.view addSubview:self.kindView];
    
    
    self.imageFlg = 0;
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    AudioServicesPlaySystemSound(_growl);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_growl);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm schluckt" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_gulp);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm Bauch" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_belly);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm spuckt" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_spit);
    
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.imageFlg == 0) {
        [self.textView setHidden:YES];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-drohgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage: image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.kindView setImage:image];
        rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [self.view addSubview:self.kindView];
        
        self.imageFlg = 1;
    }
    else if (self.imageFlg == 1) {
        AudioServicesPlaySystemSound(_gulp);
        [self.kindView removeFromSuperview];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12c-klettergroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen12a" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.textView setImage:image];
        [self.textView setHidden:NO];
        
        self.imageFlg = 2;
    }
    else if (self.imageFlg == 2) {
        AudioServicesPlaySystemSound(_belly);
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12b-schluckgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        [self.textView setHidden:YES];
        
        self.imageFlg = 3;
    }
    
    else if (self.imageFlg == 3){
        AudioServicesPlaySystemSound(_spit);
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12c-spuckgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen04c-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.kindView setImage:image];
        rect = CGRectMake(750.0f, 300.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [self.view addSubview:self.kindView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen12c" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.textView setImage:image];
        [self.textView setHidden:NO];
        
        //enable pageViews recognizer
        [self.rootViewController enablePan];
        //[self loadLambsEar];
        self.panEnabled = YES;
        
        self.imageFlg = 4;
    }
    
}

@end
