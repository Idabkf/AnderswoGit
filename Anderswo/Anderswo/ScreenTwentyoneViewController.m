//
//  ScreenTwentyoneViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentyoneViewController.h"
#import "RootViewController.h"

@interface ScreenTwentyoneViewController ()

@end

@implementation ScreenTwentyoneViewController

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
    
    self.rectLeft = CGRectMake(0.0f, 0.0f, 100.0f, 768.0f);
    self.rectRight = CGRectMake(924.0f, 0.0f, 100.0f, 768.0f);
    
    // Adjust the image
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen21-RAETSEL-3-vIda_ohneKorken" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc] initWithImage:image];
    [self.backgroundView setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.backgroundView.frame = rect;
    [self.view addSubview:self.backgroundView];
    
    //Corks
    [self setCorks];
    
    //Sand
    self.sandView = [[EraserView alloc] initWithFrame:self.backgroundView.frame];
    [self.backgroundView addSubview:self.sandView];
    
    //invisble corks for longPress
    [self setInvisibleCorks];
    
    
    //Swipe to adjust center of view
    UISwipeGestureRecognizer *swipeLRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLRecognizer.delegate = self;
    swipeLRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLRecognizer];
    
    UISwipeGestureRecognizer *swipeRRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRRecognizer.delegate = self;
    swipeRRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRRecognizer];
    
    //GestureRecognizer Pan
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.panRecognizer];
    
    
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Sand wegwischen" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_sand);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Flaschenkorken" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_plop);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_finished);
}

-(void) setPositions{
    
    //0
    self.p0 = CGPointMake(509.75,268.25);
    //1
    self.p1 = CGPointMake(491,460.25);
    //2
    self.p2 = CGPointMake(1106.75,370.25);
    
    //3
    self.p3 = CGPointMake(1197.5,601);
    //4
    self.p4 = CGPointMake(1293,44.25);
    //5
    self.p5 = CGPointMake(1521.5,147);
    
    //6
    self.p6 = CGPointMake(960.75,128.5);
    //7
    self.p7 = CGPointMake(1539.75,656.5);
    //8
    self.p8 = CGPointMake(1800.75,259.75);
    
    //9
    self.p9 = CGPointMake(1988.5,626.25);
    
}

-(CGPoint) getPositionAtIndex: (int)index{
    if (index == 0) return self.p0;
    if (index == 1) return self.p1;
    if (index == 2) return self.p2;
    if (index == 3) return self.p3;
    if (index == 4) return self.p4;
    if (index == 5) return self.p5;
    if (index == 6) return self.p6;
    if (index == 7) return self.p7;
    if (index == 8) return self.p8;
    if (index == 9) return self.p9;
    
    return self.p0;
}

-(void) setCorks{
    
    [self setPositions];
    
    self.corks = [[NSMutableDictionary alloc]initWithCapacity:10];
    
    for (int i=0; i<10; i++) {
        NSString *filename = [NSString stringWithFormat:@"3%i", i];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        CorkView *corkView = [[CorkView alloc] initWithImage:image];
        
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        corkView.frame = rect;
        CGPoint position = [self getPositionAtIndex:i];
        [corkView setCenter:position];
        
        [self.backgroundView addSubview:corkView];
        [corkView setUserInteractionEnabled:YES];
        [self.corks setObject:corkView forKey:filename];
        
        //GestureRecognizer Longpress
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapRecognizer.delegate = self;
        [corkView addGestureRecognizer:tapRecognizer];
    }
    
}

-(void) setInvisibleCorks{
    
    [self setPositions];
    
    self.corksInvisible = [[NSMutableDictionary alloc]initWithCapacity:10];
    
    for (int i=0; i<10; i++) {
        NSString *filename = [NSString stringWithFormat:@"3%i", i];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        CorkView *corkView = [[CorkView alloc] initWithImage:image];
        
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        corkView.frame = rect;
        CGPoint position = [self getPositionAtIndex:i];
        [corkView setCenter:position];
        
        [self.backgroundView addSubview:corkView];
        [corkView setUserInteractionEnabled:YES];
        [self.corksInvisible setObject:corkView forKey:filename];
        [corkView setAlpha:0.05f];
        
        //GestureRecognizer Longpress
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapRecognizer.delegate = self;
        [corkView addGestureRecognizer:tapRecognizer];
    }
    
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        AudioServicesPlaySystemSound(_sand);
    }
    
    //move center of view
    CGPoint locationInHoleView = [recognizer locationInView:self.view];
    
    //show left side
    if (CGRectContainsPoint(self.rectLeft, locationInHoleView)) {
        if (self.backgroundView.frame.origin.x<0) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x+8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
    //show right side
    if (CGRectContainsPoint(self.rectRight, locationInHoleView)) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.sandView.erasing = YES;
    }
    
    self.sandView.location = [recognizer locationInView:self.backgroundView];
    [self.sandView setNeedsDisplay];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    AudioServicesPlaySystemSound(_plop);
    
    for (int i = 0; i<10; i++) {
        NSString *key = [NSString stringWithFormat:@"3%i", i];
        if ([self.corksInvisible objectForKey:key]==recognizer.view) {
            CorkView *corkView = [self.corks objectForKey:key ];
            [corkView removeFromSuperview];
            [recognizer.view removeFromSuperview];
            [[self.corksInvisible objectForKey:key] removeGestureRecognizer:recognizer];
            [corkView removeGestureRecognizer:recognizer];
            [self.corks removeObjectForKey:key];
            [self.corksInvisible removeObjectForKey:key];
        }
    }
    
    if (self.corks.count == 0) {
        //enable pageViews recognizer
        [self.rootViewController enablePan];
        //[self loadLambsEar];
        self.panEnabled = YES;
        [self.sandView removeFromSuperview];
        AudioServicesPlaySystemSound(_finished);
        [self.view removeGestureRecognizer:self.panRecognizer];
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer{
    //show left side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    //show right side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
}


@end
