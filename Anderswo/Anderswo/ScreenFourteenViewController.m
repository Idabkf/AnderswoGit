//
//  ScreenFourteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenFourteenViewController.h"
#import "RootViewController.h"

@interface ScreenFourteenViewController ()

@end

@implementation ScreenFourteenViewController

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
    
    //Rects to move to the right or to the left
    self.rectLeft = CGRectMake(0.0f, 0.0f, 100.0f, 768.0f);
    self.rectRight = CGRectMake(924.0f, 0.0f, 100.0f, 768.0f);
    
    // Adjust the image
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Labyrinth+Wasser-NEU" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc] initWithImage:image];
    [self.backgroundView setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.backgroundView.frame = rect;
    [self.view addSubview:self.backgroundView];
    
    
    //TEXT
    pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen14a" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.textView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView.frame = rect;
    [self.view addSubview:self.textView];
    [self.textView setHidden:YES];
    
    //TEXT2
    pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen14b" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.textView2 = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.textView2.frame = rect;
    
    //rect = CGRectMake(65, 0, 1983.0f, 768.0f);
    self.labyrinthView = [[LabyrinthView alloc] initWithFrame:self.backgroundView.frame];
    //[self.backgroundView addSubview:self.labyrinthView];
    
    self.allEyesCollected = NO;
    
    
    [self setEyes];
    [self setLamprey];
    [self setOrf];
    [self setUboot];
    //[self loadLabyrinth];
    
    
    
    
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
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Auge" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_eye);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_finished);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Neunauge" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_lamprey);
    
}

-(void) loadLabyrinth{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Labyrinth" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.labyrinthView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, 2048.0f, 768.0f);
    self.labyrinthView.frame = rect;
    [self.backgroundView addSubview:self.labyrinthView];
    self.labyrinthView.alpha = 0.0f;
    //[self.ubootView setUserInteractionEnabled:NO];
}

-(void) setUboot{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-UBoot" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.ubootView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(30.0f, 30.0f, image.size.width/2, image.size.height/2);
    self.ubootView.frame = rect;
    [self.ubootView setUserInteractionEnabled:YES];
    [self.backgroundView addSubview:self.ubootView];
    
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer1.delegate = self;
    [self.ubootView addGestureRecognizer:panRecognizer1];
    
}

-(void) setPositions{
    
    //0
    self.p0 = CGPointMake(257.5f, 268.75f);
    //1
    self.p1 = CGPointMake(492.0f, 115.75f);
    //2
    self.p2 = CGPointMake(695.75f, 596.25f);
    
    //3
    self.p3 = CGPointMake(1707.0f, 376.0f);
    //4
    self.p4 = CGPointMake(1417.5f, 54.0f);
    //5
    self.p5 = CGPointMake(895.0f, 51.5f);
    
    //6
    self.p6 = CGPointMake(838.0f, 632.0f);
    //7
    self.p7 = CGPointMake(1688.75f, 598.5f);
    //8
    self.p8 = CGPointMake(1619.75f, 76.25f);
    
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
    
    return self.p0;
}

-(void) setEyes{
    
    [self setPositions];
    
    self.eyes = [[NSMutableArray alloc]initWithCapacity:9];
    
    for (int i=0; i<9; i++) {
        NSString *filename = [NSString stringWithFormat:@"2%i", i];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        EyeView *eyeView = [[EyeView alloc] initWithImage:image];
        
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        eyeView.frame = rect;
        CGPoint position = [self getPositionAtIndex:i];
        [eyeView setCenter:position];
        
        [self.backgroundView addSubview:eyeView];
        [eyeView setUserInteractionEnabled:NO];
        [self.eyes addObject:eyeView];
    }
    
}

-(void) setLamprey{
    /*
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Neunauge" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.lampreyView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.lampreyView.frame = rect;
    [self.lampreyView setCenter:CGPointMake(1324.75f, 601.0f)];
    //[self.lampreyView setUserInteractionEnabled:YES];
    [self.backgroundView addSubview:self.lampreyView];
    self.lampreyVisible = YES;
     */
    
    //LAMPREY 1
    self.lampreyViewNew = [[LampreyView alloc] initWithFrame:self.backgroundView.frame];
    [self.backgroundView addSubview:self.lampreyViewNew];
    self.lampreyVisible = YES;
    
    //LAMPREY 2
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Neunauge+Augen" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.lampreyView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0,0, image.size.width/2, image.size.height/2);
    self.lampreyView.frame = rect;
    CGPoint point = CGPointMake(958.0f, 460.5f);
    [self.lampreyView setCenter:point];
}

-(void) setOrf{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Wasserorfkleines" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.orfView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.orfView.frame = rect;
    [self.orfView setCenter:CGPointMake(1903.5f, 132.25f)];
    //[self.lampreyView setUserInteractionEnabled:YES];
    [self.backgroundView addSubview:self.orfView];
}


-(void)handlePanOld:(UIPanGestureRecognizer *) recognizer{
    
    UIColor *color = [self.labyrinthView colorOfPoint:[recognizer locationInView:self.backgroundView]];
    UIColor *clearColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    //move center of view
    CGPoint locationInHoleView = [recognizer locationInView:self.view];
    CGPoint locationInBackView = [recognizer locationInView:self.backgroundView];
    
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
   
    if (recognizer.view == self.ubootView) {
        
        //Collision with lamprey
        if (CGRectIntersectsRect(self.lampreyView.frame, recognizer.view.frame) && self.lampreyVisible) {
            
            if (!self.allEyesCollected) {
                //Move only backwards
                if (locationInBackView.x <= self.ubootView.center.x && [clearColor isEqual:color]) {
                    //move uboot
                    recognizer.view.center = [recognizer locationInView:self.backgroundView];
                }
                //SHOW MESSAGE
                [self.textView setHidden:NO];
                AudioServicesPlaySystemSound(_lamprey);
            }
            else {
                //Show thanks-message
                //NSLog(@"COLLISION WITH LAMPREY - ALL EYES COLLECTED");
                AudioServicesPlaySystemSound(_lamprey);
                
                NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Neunauge+Augen" ofType:@"png"];
                UIImage *image = [UIImage imageWithContentsOfFile:pathString];
                [self.lampreyView setImage:image];
                CGRect rect = CGRectMake(0, 0, image.size.width/4, image.size.height/4);
                self.lampreyView.frame = rect;
                self.lampreyVisible = NO;
                
                //TEXT
                pathString = [[NSBundle mainBundle] pathForResource:@"Text-Screen14b" ofType:@"png"];
                image = [UIImage imageWithContentsOfFile:pathString];
                [self.textView2 setImage:image];
                [self.textView2 setHidden:NO];
                //rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
                //self.textView.frame = rect;
                
                
                
                /*
                [UIImageView animateWithDuration:12.0
                                           delay:0.0
                                         options:nil
                                      animations:^{
                                          CGRect rect = CGRectMake(0, 1024-image.size.width/2, image.size.width/2, image.size.height/2);
                                      }completion:^(BOOL finished){
                                          [self.lampreyView removeFromSuperview];
                                          self.lampreyVisible = NO;
                                      }];
                */
            
                
            }
        }
        
        //Collision with orf
        else if (CGRectIntersectsRect(self.orfView.frame, recognizer.view.frame)) {
            [self.textView setHidden:YES];
            //NSLog(@"COLLISION WITH ORF");
            AudioServicesPlaySystemSound(_finished);
            //no more moving
            [recognizer.view removeGestureRecognizer:recognizer];
            //enable pageViews recognizer
            [self.rootViewController enablePan];
            //[self loadLambsEar];
            self.panEnabled = YES;
        }
        
        else{
            [self.textView setHidden:YES];
            if ([clearColor isEqual:color]) {
                //move uboot
                recognizer.view.center = [recognizer locationInView:self.backgroundView];
            }
            
            
            
            //check collision with eye
            for (int i = 0; i<self.eyes.count; i++) {
                EyeView *eyeView = [self.eyes objectAtIndex:i];
                if (CGRectIntersectsRect(recognizer.view.frame, eyeView.frame )) {
                    AudioServicesPlaySystemSound(_eye);
                   // NSLog(@"EYE FOUND - STILL %i EYES LEFT", self.eyes.count);
                    [UIImageView animateWithDuration:3.0
                                               delay:0.0
                                             options:nil
                                          animations:^{
                                              eyeView.alpha = 0.0f;
                                          }completion:^(BOOL finished){
                                              [eyeView removeFromSuperview];
                                              [self.eyes removeObject:eyeView];
                                              if (self.eyes.count == 0) {
                                                  self.allEyesCollected = YES;
                                                  AudioServicesPlaySystemSound(_lamprey);
                                              }
                                          }];
                }
            }

        }
                
    }
    
    
    
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    UIColor *color = [self.labyrinthView colorOfPoint:[recognizer locationInView:self.backgroundView]];
    UIColor *colorLamprey = [self.lampreyViewNew colorOfPoint:[recognizer locationInView:self.backgroundView]];
    UIColor *clearColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    //move center of view
    CGPoint locationInHoleView = [recognizer locationInView:self.view];
    CGPoint locationInBackView = [recognizer locationInView:self.backgroundView];
    
    //show left side
    if (CGRectContainsPoint(self.rectLeft, locationInHoleView)) {
        
        if (self.backgroundView.frame.origin.x<0) {
            /*
            recognizer.enabled = NO;
            recognizer.enabled = YES;
            
            float move = 32.0f;
            if (self.backgroundView.frame.origin.x+ 32.0f >0) {
                move = self.backgroundView.frame.origin.x *(-1);
            }
            
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x+move, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            CGPoint point = CGPointMake(self.ubootView.center.x+move, self.ubootView.center.y);
            [UIImageView animateWithDuration:1.0
                                  animations:^{
                                      self.backgroundView.frame = rect;
                                      [self.ubootView setCenter:point];
                                  }];
            [self.ubootView setCenter:point];
             */
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x+8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
             
        }
         
        
    }
    
    //show right side
    if (CGRectContainsPoint(self.rectRight, locationInHoleView)) {
        
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            /*
            recognizer.enabled = NO;
            recognizer.enabled = YES;
            
            float move = 32.0f;
            if (self.backgroundView.frame.origin.x- 32.0f <-1024.0f) {
                move = -1024.0f-self.backgroundView.frame.origin.x;
                move = move * (-1);
               
            }
            
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-move, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            CGPoint point = CGPointMake(self.ubootView.center.x-move, self.ubootView.center.y);
            [UIImageView animateWithDuration:1.0
                                  animations:^{
                                      self.backgroundView.frame = rect;
                                      [self.ubootView setCenter:point];
                                  }];
            [self.ubootView setCenter:point];
            */
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
            
         
        }
         
    }
    
    //Collision with lamprey
    if (![clearColor isEqual:colorLamprey]){
        
        AudioServicesPlaySystemSound(_lamprey);
        recognizer.enabled = NO;
        
        
        if (!self.allEyesCollected) {
            [self.textView setHidden:NO];
            recognizer.enabled = YES;
        }
        else {
            self.lampreyVisible = NO;
            [self.lampreyViewNew removeFromSuperview];
            [self.view addSubview:self.lampreyView];
            [self.lampreyView setHidden:NO];
            [self.view addSubview:self.textView2];
            [self.textView2 setHidden:NO];
            
            
             [UIImageView animateWithDuration:20.0
                                        delay:0.0
                                      options:nil
                                   animations:^{
                                       CGPoint point = CGPointMake(-3165, 460.5f);
                                       [self.lampreyView setCenter:point];
                                   }completion:^(BOOL finished){
                                       //[self.lampreyView setHidden:YES];
                                       //[self.textView2 setHidden:YES];
                                       recognizer.enabled = YES;
                                   }];
        }
    }
    //Collision with orf
    else if (CGRectIntersectsRect(self.orfView.frame, recognizer.view.frame)) {
        [self.textView setHidden:YES];
        //NSLog(@"COLLISION WITH ORF");
        AudioServicesPlaySystemSound(_finished);
        //no more moving
        [recognizer.view removeGestureRecognizer:recognizer];
        //enable pageViews recognizer
        [self.rootViewController enablePan];
        //[self loadLambsEar];
        self.panEnabled = YES;
    }
    else {
        [self.textView setHidden:YES];
        [self.textView2 setHidden:YES];
        if ([clearColor isEqual:color]) {
            //move uboot
            recognizer.view.center = [recognizer locationInView:self.backgroundView];
        }
        else {
            recognizer.enabled = NO;
            recognizer.enabled = YES;
        }
        
        //check collision with eye
        for (int i = 0; i<self.eyes.count; i++) {
            EyeView *eyeView = [self.eyes objectAtIndex:i];
            if (CGRectIntersectsRect(recognizer.view.frame, eyeView.frame )) {
                AudioServicesPlaySystemSound(_eye);
                // NSLog(@"EYE FOUND - STILL %i EYES LEFT", self.eyes.count);
                [UIImageView animateWithDuration:3.0
                                           delay:0.0
                                         options:nil
                                      animations:^{
                                          eyeView.alpha = 0.0f;
                                      }completion:^(BOOL finished){
                                          [eyeView removeFromSuperview];
                                          [self.eyes removeObject:eyeView];
                                          if (self.eyes.count == 0) {
                                              self.allEyesCollected = YES;
                                              AudioServicesPlaySystemSound(_lamprey);
                                          }
                                      }];
            }
        }

    }
    
}

@end
