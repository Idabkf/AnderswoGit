//
//  ScreenEightViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenEightViewController.h"
//#import "RootViewController.h"

@interface ScreenEightViewController ()

@end

@implementation ScreenEightViewController

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
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen08" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    
    [self initRects];
    
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.panEnabled) {
        //disable pageViews recognizer
        //[self.rootViewController disablePan];
        self.panEnabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initSounds{
   
    for (int i = 1; i<7; i++) {
        NSString *filename = [NSString stringWithFormat:@"Wald Orfe %i", i];
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"m4a"];
        NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
        AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), [self getSoundIdWithIndex:i]);
    }
}

-(SystemSoundID *)getSoundIdWithIndex:(int) index{
    if (index == 0) return &(_orf1);
    if (index == 1) return &(_orf2);
    if (index == 2) return &(_orf3);
    if (index == 3) return &(_orf4);
    if (index == 4) return &(_orf5);
    if (index == 5) return &(_orf6);
    
    return &(_orf1);;
}

-(void) initRects{
    self.rectOrf1 = CGRectMake(64.5-50,137.75-50, 100.0f, 100.0f);
    self.rectOrf2 = CGRectMake(210.75-50,192.25-50, 100.0f, 100.0f);
    self.rectOrf3 = CGRectMake(208-50,51.25-50, 100.0f, 100.0f);
    self.rectOrf4 = CGRectMake(322.75-50,65.25-50, 100.0f, 100.0f);
    self.rectOrf5 = CGRectMake(459.5-50,573-50, 100.0f, 100.0f);
    self.rectOrf6 = CGRectMake(471.75-50,366-50, 100.0f, 100.0f);
    self.rectOrf7 = CGRectMake(702-50,611.25-50, 100.0f, 100.0f);
    self.rectOrf8 = CGRectMake(823.25-50,319-50, 100.0f, 100.0f);
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    if (self.panEnabled == NO) {
        //enable pageViews recognizer
        //[self.rootViewController enablePan];
        self.panEnabled = YES;
    }
    
    CGPoint point = [recognizer locationInView:self.view];
    
    if (CGRectContainsPoint(self.rectOrf1, point)) {
        AudioServicesPlaySystemSound(_orf1);
    }
    else if (CGRectContainsPoint(self.rectOrf2, point)) {
        AudioServicesPlaySystemSound(_orf2);
    }
    else if (CGRectContainsPoint(self.rectOrf3, point)) {
        AudioServicesPlaySystemSound(_orf3);
    }
    else if (CGRectContainsPoint(self.rectOrf4, point)) {
        AudioServicesPlaySystemSound(_orf4);
    }
    else if (CGRectContainsPoint(self.rectOrf5, point)) {
        AudioServicesPlaySystemSound(_orf5);
    }
    else if (CGRectContainsPoint(self.rectOrf6, point)) {
        AudioServicesPlaySystemSound(_orf6);
    }
    else if (CGRectContainsPoint(self.rectOrf7, point)) {
        AudioServicesPlaySystemSound(_orf5);
    }
    else if (CGRectContainsPoint(self.rectOrf8, point)) {
        AudioServicesPlaySystemSound(_orf6);
    }
}

@end
