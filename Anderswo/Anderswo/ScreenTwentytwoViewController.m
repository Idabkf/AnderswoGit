//
//  ScreenTwentytwoViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentytwoViewController.h"
//#import "RootViewController.h"

@interface ScreenTwentytwoViewController ()

@end

@implementation ScreenTwentytwoViewController

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
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen22" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    
    [self initSounds];
    
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
        NSString *filename = [NSString stringWithFormat:@"Wünschel Orfe %i", i];
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
    self.rectOrf1 = CGRectMake(113-50,473.25-50, 100.0f, 100.0f);
    self.rectOrf2 = CGRectMake(107.75-50,661.75-50, 100.0f, 100.0f);
    self.rectOrf3 = CGRectMake(245-50,148.25-50, 100.0f, 100.0f);
    
    self.rectOrf4 = CGRectMake(230.75-50,49.5-50, 100.0f, 100.0f);
    self.rectOrf5 = CGRectMake(272.5-50,223.25-50, 100.0f, 100.0f);
    self.rectOrf6 = CGRectMake(455.25-50,450.75-50, 100.0f, 100.0f);
    
    self.rectOrf7 = CGRectMake(573.25-50,134.25-50, 100.0f, 100.0f);
    self.rectOrf8 = CGRectMake(912.5-50,388-50, 100.0f, 100.0f);
    self.rectOrf9 = CGRectMake(891.25-50,135.75-50, 100.0f, 100.0f);
    
    self.rectOrf0 = CGRectMake(1011.25-50,257.25-50, 100.0f, 100.0f);
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
        AudioServicesPlaySystemSound(_orf3);
    }
    else if (CGRectContainsPoint(self.rectOrf8, point)) {
        AudioServicesPlaySystemSound(_orf4);
    }
    else if (CGRectContainsPoint(self.rectOrf9, point)) {
        AudioServicesPlaySystemSound(_orf5);
    }
    else if (CGRectContainsPoint(self.rectOrf0, point)) {
        AudioServicesPlaySystemSound(_orf6);
    }
}

@end
