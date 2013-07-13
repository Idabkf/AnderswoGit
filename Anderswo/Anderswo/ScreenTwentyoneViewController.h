//
//  ScreenTwentyoneViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
#import "EraserView.h"
#import "CorkView.h"

@interface ScreenTwentyoneViewController : ScreenViewController{
    SystemSoundID _sand;
    SystemSoundID _plop;
    SystemSoundID _finished;
}

@property UIPanGestureRecognizer *panRecognizer;

@property UIImageView *backgroundView;
@property EraserView *sandView;
@property CGRect rectLeft;
@property CGRect rectRight;

@property CorkView *corkView;
@property NSMutableDictionary *corks;
@property NSMutableDictionary *corksInvisible;

@property CGPoint p0;
@property CGPoint p1;
@property CGPoint p2;
@property CGPoint p3;
@property CGPoint p4;
@property CGPoint p5;
@property CGPoint p6;
@property CGPoint p7;
@property CGPoint p8;
@property CGPoint p9;

@end
