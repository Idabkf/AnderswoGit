//
//  RootViewController.h
//  Anderswo
//
//  Created by Ida Buchwald on 14.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenViewController.h"

@interface RootViewController : UIViewController{
    SystemSoundID _flip;
    SystemSoundID _close;
    SystemSoundID _start;
    AVAudioPlayer *_backgroundMusicPlayer;
}

@property ScreenViewController *currentScreen;

@property UIViewController *curlController;

@property UIImageView *lambsear;
@property UIImageView *lambsearLeft;

@property CGFloat maxVolume;

-(void) enablePan;
-(void)handleNextTap:(UITapGestureRecognizer *) recognizer;

@end
