//
//  ScreenTenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTenViewController.h"
#import "RootViewController.h"

@interface ScreenTenViewController ()

@end

@implementation ScreenTenViewController

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
    
    /*
    self.frameRect = self.view.frame;
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchRecognizer.delegate = self;
    [self.view addGestureRecognizer:pinchRecognizer];
     */
    
    if (!self.items) {
        self.items = [[NSMutableArray alloc] init];
    }

    //CITY
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen02-Stadt-wischbar_stadt" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(-30, 0, image.size.width/2, image.size.height/2);
    imageView.frame = rect;
    [self.view addSubview:imageView];

    //STOCK
    pathString = [[NSBundle mainBundle] pathForResource:@"Inventarleiste" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.stockView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.stockView.frame = rect;
    CGPoint point = CGPointMake(512.0f, 697.5f);
    [self.stockView setCenter:point];
    [self.stockView setUserInteractionEnabled:NO];
    [self.view addSubview:self.stockView];
    
    [self initBucket];
    
    //MUSHROOMS
    [self initMushroomWithImage:0];
    [self initMushroomWithImage:1];
    [self initMushroomWithImage:2];
    
    
    
}

 -(void) viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     
     //play music
     [_backgroundMusicPlayer prepareToPlay];
     [_backgroundMusicPlayer play];
     
     self.itemSet = NO;
 
     /*
     if (self.panEnabled) {
         //disable pageViews recognizer
         [self.rootViewController disablePan];
         self.panEnabled = NO;
     }
     
     if (self.panEnabled == NO) {
         //enable pageViews recognizer
         [self.rootViewController enablePan];
         self.panEnabled = YES;
     }
     */
     //[self loadLambsEar];
     
     //EYES
     NSNumber *data = self.dataObject;
     if ([data isEqualToNumber:[NSNumber numberWithInt:14]]) {
         [self initEyeWithImage:0];
         [self initEyeWithImage:1];
         [self initEyeWithImage:2];
     }
     
     //BOTTLES
     else if ([data isEqualToNumber:[NSNumber numberWithInt:20]]) {
         [self initEyeWithImage:0];
         [self initEyeWithImage:1];
         [self initEyeWithImage:2];
         [self initBottleWithImage:0];
         [self initBottleWithImage:1];
         [self initBottleWithImage:2];
     }
     
     else if ([data isEqualToNumber:[NSNumber numberWithInt:21]]) {
         //TEXT
         NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen25" ofType:@"png"];
         UIImage *image = [UIImage imageWithContentsOfFile:pathString];
         self.textView = [[UIImageView alloc]initWithImage:image];
         CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
         self.textView.frame = rect;
         [self.view addSubview:self.textView];
         
         [self.stockView removeFromSuperview];
         [self.bucketView removeFromSuperview];
         
         [self.bottle1View removeFromSuperview];
         [self.bottle2View removeFromSuperview];
         [self.bottle3View removeFromSuperview];
         [self.eye1View removeFromSuperview];
         [self.eye2View removeFromSuperview];
         [self.eye3View removeFromSuperview];
         [self.mushroom1View removeFromSuperview];
         [self.mushroom2View removeFromSuperview];
         [self.mushroom3View removeFromSuperview];
         
         [self fadeOutItems];
         
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
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"StadtAmbient-neu" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    //AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_ambient);
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    [_backgroundMusicPlayer setDelegate:self];
    [_backgroundMusicPlayer setNumberOfLoops:-1];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Pilz" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_mushroom);
}

-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Pilz" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_mushroom);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Auge" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_eye);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Flaschenkorken" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_bottle);
    
}

-(void) setItemsOfOldScreen{
    for (StockItemView *stockitem in self.items) {
        [self.view addSubview:stockitem];
    }
}

-(void)initBucket{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Muell" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.bucketView = [[UIImageView alloc]initWithImage:image];
    
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.bucketView.frame = rect;
    CGPoint point = CGPointMake(954.75f, 693.25f);
    [self.bucketView setCenter:point];
    [self.bucketView setUserInteractionEnabled:YES];
    [self.view addSubview:self.bucketView];
}

-(void)initMushroomWithImage:(int)imageId{
    CGPoint point = CGPointMake(0, 0);
    if(imageId == 0){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Pilz1" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom1View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.mushroom1View.frame = rect;
        point = CGPointMake(60.25f, 695.5f);
        [self.mushroom1View setCenter:point];
        [self.mushroom1View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom1View];
        UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer1.delegate = self;
        [self.mushroom1View addGestureRecognizer:panRecognizer1];
    }
    else if(imageId == 1){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Pilz2" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom2View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.mushroom2View.frame = rect;
        point = CGPointMake(162.0f, 696.75f);
        [self.mushroom2View setCenter:point];
        [self.mushroom2View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom2View];
        UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer2.delegate = self;
        [self.mushroom2View addGestureRecognizer:panRecognizer2];
    }
    else{
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Pilz3" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom3View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.mushroom3View.frame = rect;
        point = CGPointMake(268.25f, 696.5f);
        [self.mushroom3View setCenter:point];
        [self.mushroom3View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom3View];
        UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer3.delegate = self;
        [self.mushroom3View addGestureRecognizer:panRecognizer3];
    }
}

-(void)initEyeWithImage:(int)imageId{
    CGPoint point = CGPointMake(0, 0);
    if(imageId == 0){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Aug1" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye1View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.eye1View.frame = rect;
        point = CGPointMake(370.0f, 696.75f);
        [self.eye1View setCenter:point];
        [self.eye1View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye1View];
        UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer1.delegate = self;
        [self.eye1View addGestureRecognizer:panRecognizer1];
    }
    else if(imageId == 1){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Aug2" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye2View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.eye2View.frame = rect;
        point = CGPointMake(465.5f, 697.5f);
        [self.eye2View setCenter:point];
        [self.eye2View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye2View];
        UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer2.delegate = self;
        [self.eye2View addGestureRecognizer:panRecognizer2];
    }
    else{
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Aug3" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye3View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.eye3View.frame = rect;
        point = CGPointMake(573.5f, 696.75f);
        [self.eye3View setCenter:point];
        [self.eye3View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye3View];
        UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer3.delegate = self;
        [self.eye3View addGestureRecognizer:panRecognizer3];
    }

}

-(void)initBottleWithImage:(int)imageId{
    CGPoint point = CGPointMake(0, 0);
    if(imageId == 0){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Flasche1" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.bottle1View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.bottle1View.frame = rect;
        point = CGPointMake(683.5f, 697.75f);
        [self.bottle1View setCenter:point];
        [self.bottle1View setUserInteractionEnabled:YES];
        [self.view addSubview:self.bottle1View];
        UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer1.delegate = self;
        [self.bottle1View addGestureRecognizer:panRecognizer1];
    }
    else if(imageId == 1){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Flasche2" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.bottle2View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.bottle2View.frame = rect;
        point = CGPointMake(777.5f, 698.5f);
        [self.bottle2View setCenter:point];
        [self.bottle2View setUserInteractionEnabled:YES];
        [self.view addSubview:self.bottle2View];
        UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer2.delegate = self;
        [self.bottle2View addGestureRecognizer:panRecognizer2];
    }
    else{
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Inventar-Flasche3" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.bottle3View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.bottle3View.frame = rect;
        point = CGPointMake(858.5f, 696.5f);
        [self.bottle3View setCenter:point];
        [self.bottle3View setUserInteractionEnabled:YES];
        [self.view addSubview:self.bottle3View];
        UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer3.delegate = self;
        [self.bottle3View addGestureRecognizer:panRecognizer3];
    }
    
}

-(void) fadeOutItems{
    /*
    StockItemView *item = [self.items objectAtIndex:0];
    [UIImageView animateWithDuration:20.0
                               delay:3.0
                             options:nil
                          animations:^{
                              item.alpha = 0.0;
                          }completion:^(BOOL finished){
                              //[item removeFromSuperview];
                          }];
     */
    for (StockItemView *item in self.items) {
        [UIImageView animateWithDuration:15.0
                                   delay:2.0
                                 options:nil
                              animations:^{
                                  item.alpha = 0.0;
                              }completion:^(BOOL finished){
                                  //[item removeFromSuperview];
                                  if (!self.panEnabled) {
                                      self.panEnabled = YES;
                                      [self.rootViewController enablePan];
                                  }
                              }];
    }
    
}


-(void)handlePan:(UIPanGestureRecognizer *) recognizer{

    if (recognizer.state == UIGestureRecognizerStateBegan){
        
        if (!self.itemSet) {
            [self.rootViewController enablePan];
            self.panEnabled = YES;
            self.itemSet = YES;
        }
        
        self.stockItemView = [[StockItemView alloc] initWithFrame:recognizer.view.frame];
        UIImageView *imageView = (UIImageView *)recognizer.view;
        UIImage *image = imageView.image;
        [self.stockItemView setImage:image];
        [self.view addSubview:self.stockItemView];
        self.stockItemView.bucketRect = self.bucketView.frame;
        
        if (recognizer.view == self.mushroom1View || recognizer.view == self.mushroom2View || recognizer.view == self.mushroom3View) {
            AudioServicesPlaySystemSound(_mushroom);
        }
        
        else if (recognizer.view == self.eye1View || recognizer.view == self.eye2View || recognizer.view == self.eye3View) {
            AudioServicesPlaySystemSound(_eye);
        }
        
        
         else if (recognizer.view == self.bottle1View || recognizer.view == self.bottle2View || recognizer.view == self.bottle3View) {
         AudioServicesPlaySystemSound(_bottle);
         }
        
        [self.items addObject:self.stockItemView];
        
    }
    
    self.stockItemView.center = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (CGRectIntersectsRect(self.stockItemView.frame, self.stockView.frame)) {
            [self.stockItemView removeFromSuperview];
        }
        
        if (CGRectIntersectsRect(self.bucketView.frame, self.stockItemView.frame)) {
            [self.stockItemView removeFromSuperview];
        }
        
    }
}

-(void)handlePinch:(UIPinchGestureRecognizer *) recognizer{
    
    //if(self.zoomScale) self.zoomScale = MAX(self.zoomScale, recognizer.scale );
    self.zoomScale = recognizer.scale;
    self.zoomScale = MAX(self.zoomScale, 1.0);
    self.zoomScale = MIN(self.zoomScale, 3.0);
    
    
    recognizer.view.transform = CGAffineTransformMakeScale(self.zoomScale, self.zoomScale);
    /*
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded){
        if (CGRectGetHeight(self.view.frame) < 769) {
            self.view.frame = self.frameRect;
            NSLog(@"HEIGHT: %f",CGRectGetHeight(self.view.frame) );
        }
    }*/
}

@end
