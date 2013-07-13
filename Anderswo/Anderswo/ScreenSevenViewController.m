//
//  ScreenSevenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenSevenViewController.h"
#import "MushroomView.h"
//#import "RootViewController.h"

@interface ScreenSevenViewController ()

@end

@implementation ScreenSevenViewController

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
    
    self.countFinishedMushrooms = 0;
    
    // Adjust the image
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen07-RAETSEL-1-ohnepilzkappen" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc] initWithImage:image];
    [self.backgroundView setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.backgroundView.frame = rect;
    
    //Swipe to adjust center of view
    UISwipeGestureRecognizer *swipeLRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLRecognizer.delegate = self;
    swipeLRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLRecognizer];
    
    UISwipeGestureRecognizer *swipeRRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRRecognizer.delegate = self;
    swipeRRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRRecognizer];
    
    
    [self.view addSubview:self.backgroundView];

   // [self loadImageViews];
    //self.screenFlag = true;
    //[self setButton];
    [self setMushrooms];
    
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

/*
-(void)loadImageViews{
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen07-RAETSEL-1-1" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.screen1 = image;
    
    self.screen1View = [[UIImageView alloc] initWithImage:image];
    [self.screen1View setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.screen1View.frame = rect;
    [self setCurrentScreenView:self.screen1View];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen07-RAETSEL-1-2" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.screen2 = image;
    self.screen2View = [[UIImageView alloc] initWithImage:image];
    [self.screen2View setUserInteractionEnabled:YES];
    self.screen2View.frame = rect;
}

-(void) setCurrentScreenView:(UIImageView *)screenView{
    self.currentView = screenView;
    [self.view addSubview:screenView];
}

-(void)setButton{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen07-RAETSEL-1-Button" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.buttonView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.buttonView.frame = rect;
    //second view
    CGPoint point = CGPointMake(image.size.width/4, 384.0f);
    //first view
    if (self.screenFlag) {
        point = CGPointMake(1000.5f, 384.0f);
    }
    [self.buttonView setCenter:point];
    [self.buttonView setUserInteractionEnabled:YES];
    [self.currentView addSubview:self.buttonView];
    //self.tappedFlag = true;
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognizer.delegate = self;
    [self.buttonView addGestureRecognizer:tapRecognizer];
}

-(void) moveButton{
    
    if (self.screenFlag) {
        self.buttonView.transform = CGAffineTransformMakeRotation(M_PI);
        CGPoint point = CGPointMake(self.buttonView.image.size.width/4, 384.0f);
        [self.buttonView setCenter:point];
        [self.buttonView removeFromSuperview];
        [self.currentView addSubview:self.buttonView];
    }
    else {
        self.buttonView.transform = CGAffineTransformMakeRotation(0);
        CGPoint point = CGPointMake(1000.5f, 384.0f);
        [self.buttonView setCenter:point];
        [self.buttonView removeFromSuperview];
        [self.currentView addSubview:self.buttonView];
    }
}
*/
-(NSMutableArray*) setPositions{
    NSMutableArray *positions = [[NSMutableArray alloc] init];
    
    //0
    self.p0 = CGPointMake(614.5f, 244.0f);
    //[positions addObject:(__bridge id)(&point)];
   
    //1
    self.p1 = CGPointMake(1646.75f, 713.5f);
    //[positions addObject:(__bridge id)(&point)];
    
    //2
    self.p2 = CGPointMake(461.25f, 283.5f);
    //[positions addObject:(__bridge id)(&point)];
    
    //3
    self.p3 = CGPointMake(1006.75f, 778.75f);
    //[positions addObject:(__bridge id)(&point)];
    
    //4
    self.p4 = CGPointMake(697.75f, 597.0f);
    //[positions addObject:(__bridge id)(&point)];
    
    //5
    self.p5 = CGPointMake(1912.75f, 496.5f);
    //[positions addObject:(__bridge id)(&point)];
    
    //6
    self.p6 = CGPointMake(1077.5f, 662.75f);
    //[positions addObject:(__bridge id)(&point)];
    
    //7
    self.p7 = CGPointMake(476.5f, 296.25f);
    //[positions addObject:(__bridge id)(&point)];
    
    //8
    self.p8 = CGPointMake(1894.5f, 633.25f);
    //[positions addObject:(__bridge id)(&point)];
    
    //9
    self.p9 = CGPointMake(301.5f, 277.25f);
    //[positions addObject:(__bridge id)(&point)];
    
    return positions;
}

-(NSMutableArray *) setTargets{
    NSMutableArray *targets = [[NSMutableArray alloc] init];
    
    //0
    self.t0 = CGPointMake(1592.5, 431.5);
    //[targets addObject:(__bridge id)(&point)];
    
    //1
    self.t1 = CGPointMake(74.25f, 203.25f);
    //[targets addObject:(__bridge id)(&point)];
    
    //2
    self.t2 = CGPointMake(1853.75, 303);
    //[targets addObject:(__bridge id)(&point)];
    
    //3
    self.t3 = CGPointMake(1061.75, 183.25);
    //[targets addObject:(__bridge id)(&point)];
    
    //4
    self.t4 = CGPointMake(362.25f, 85.0f);
    //[targets addObject:(__bridge id)(&point)];
    
    //5
    self.t5 = CGPointMake(1411.75f, 347.5f);
    //[targets addObject:(__bridge id)(&point)];
    
    //6
    self.t6 = CGPointMake(84.5f, 418.25f);
    //[targets addObject:(__bridge id)(&point)];
    
    //7
    self.t7 = CGPointMake(902.5f, 543.25f);
    //[targets addObject:(__bridge id)(&point)];
    
    //8
    self.t8 = CGPointMake(1188.0f, 402.25f);
    //[targets addObject:(__bridge id)(&point)];
    
    //9
    self.t9 = CGPointMake(549.5f, 614.75f);
    //[targets addObject:(__bridge id)(&point)];
    
    return targets;

}

-(CGPoint) getTargetAtIndex: (int)index{
    if (index == 0) return self.t0;
    if (index == 1) return self.t1;
    if (index == 2) return self.t2;
    if (index == 3) return self.t3;
    if (index == 4) return self.t4;
    if (index == 5) return self.t5;
    if (index == 6) return self.t6;
    if (index == 7) return self.t7;
    if (index == 8) return self.t8;
    if (index == 9) return self.t9;
    
    return self.t0;
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

-(void) setMushrooms{
    
    [self setTargets];
    [self setPositions];
    
    for (int i=0; i<10; i++) {
        NSString *filename = [NSString stringWithFormat:@"%i", i];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        //CGPoint target = CGPointMake(1592.5f, 431.5f);
        CGPoint target = [self getTargetAtIndex:i];
        //NSLog(@"TARGET: x:%f y:%f", target.x, target.y);
        MushroomView *mushroomView = [[MushroomView alloc] initWithImage:image andTarget:target];
        
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        mushroomView.frame = rect;
        CGPoint position = [self getPositionAtIndex:i];
        //NSLog(@"POSITION: x:%f y:%f", position.x, position.y);
        /*
        if (position.x>1024) {
            position.x -=1024;
            [mushroomView setCenter:position];
            [self.screen2View addSubview:mushroomView];
        }
        else {
            [mushroomView setCenter:position];
            [self.screen1View addSubview:mushroomView];
        }
         */
        
        [mushroomView setCenter:position];
        [self.backgroundView addSubview:mushroomView];
        [mushroomView setUserInteractionEnabled:YES];
        
        
        //GestureRecognizer Pan
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer.delegate = self;
        [mushroomView addGestureRecognizer:panRecognizer];
    }
    
}

-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Pilz" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_right);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_wrong);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_finished);
    
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
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
    

    //move mushroom
    recognizer.view.center = [recognizer locationInView:self.backgroundView];
    
    //check whether the mushroom is on the right position
    MushroomView *mushroomView = (MushroomView *)recognizer.view;
    if(recognizer.state == UIGestureRecognizerStateEnded){
        //if (CGRectContainsPoint(mushroomView.targetRect, recognizer.view.center)) {
        if (CGRectIntersectsRect(mushroomView.targetRect, mushroomView.frame)) {
            mushroomView.center = mushroomView.targetPoint;
            [mushroomView removeGestureRecognizer:recognizer];
            self.countFinishedMushrooms++;
            if (self.countFinishedMushrooms == 10) {
                //enable pageViews recognizer
                //[self.rootViewController enablePan];
                self.panEnabled = YES;
                AudioServicesPlaySystemSound(_finished);
            }
           // NSLog(@"GETROFFEN");
            AudioServicesPlaySystemSound(_right);
        }
        else{
            AudioServicesPlaySystemSound(_wrong);
        }
    }
    /*
    if (CGRectContainsPoint(self.buttonView.frame, [recognizer locationInView:self.view])) {
        if (self.screenFlag) {
            [self setCurrentScreenView:self.screen2View];
            [self moveButton];
            [recognizer.view removeFromSuperview];
            [self.currentView addSubview:recognizer.view];
            self.screenFlag = false;
        }
        else {
            [self setCurrentScreenView:self.screen1View];
            [self moveButton];
            [recognizer.view removeFromSuperview];
            [self.currentView addSubview:recognizer.view];
            self.screenFlag = true;
        }
    }
    */
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer{
    
    //show left side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.backgroundView.frame.origin.x<0) {
           
            float move = 256.0f;
            if (self.backgroundView.frame.origin.x+256.0f>0) {
                move = self.backgroundView.frame.origin.x *(-1);
            }
            
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x+move, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            [UIImageView animateWithDuration:1.0
                                  animations:^{
                                      self.backgroundView.frame = rect;
                                  }];
        }
    }
    //show right side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            
            float move = 256.0f;
            if (self.backgroundView.frame.origin.x-256.0f<-1024.0f) {
                move = -1024.0f-self.backgroundView.frame.origin.x;
                move = move * (-1);
            }
            
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-move, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            [UIImageView animateWithDuration:1.0
                                  animations:^{
                                      self.backgroundView.frame = rect;
                                  }];
        }
    }
    
}

@end
