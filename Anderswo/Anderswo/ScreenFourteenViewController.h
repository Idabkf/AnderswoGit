//
//  ScreenFourteenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
#import "EyeView.h"
#import "LabyrinthView.h"
#import "LampreyView.h"

@interface ScreenFourteenViewController : ScreenViewController{
    SystemSoundID _eye;
    SystemSoundID _finished;
    SystemSoundID _lamprey;
}
@property UIImageView *textView2;

@property UIImageView *backgroundView;
@property CGRect rectLeft;
@property CGRect rectRight;

@property UIImageView *ubootView;
@property LabyrinthView *labyrinthView;
@property LampreyView *lampreyViewNew;
@property UIImageView *lampreyView;
@property UIImageView *orfView;

@property BOOL lampreyVisible;

@property EyeView *eyeView;
@property NSMutableArray *eyes;

@property BOOL allEyesCollected;

@property CGPoint p0;
@property CGPoint p1;
@property CGPoint p2;
@property CGPoint p3;
@property CGPoint p4;
@property CGPoint p5;
@property CGPoint p6;
@property CGPoint p7;
@property CGPoint p8;

@end
