//
//  ScreenSevenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenSevenViewController : ScreenViewController{
    SystemSoundID _right;
    SystemSoundID _wrong;
    SystemSoundID _finished;
}

@property UIImageView *backgroundView;
@property CGRect rectLeft;
@property CGRect rectRight;
@property int countFinishedMushrooms;

@property UIImage *screen1;
@property UIImage *screen2;

@property UIImageView *screen1View;
@property UIImageView *screen2View;
@property UIImageView *currentView;

@property UIImageView *buttonView;
@property BOOL screenFlag;

@property float swipeTmp;


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

@property CGPoint t0;
@property CGPoint t1;
@property CGPoint t2;
@property CGPoint t3;
@property CGPoint t4;
@property CGPoint t5;
@property CGPoint t6;
@property CGPoint t7;
@property CGPoint t8;
@property CGPoint t9;

@end
