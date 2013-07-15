//
//  ScreenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


@class RootViewController;


@interface ScreenViewController : UIViewController<AVAudioPlayerDelegate>{
    //SystemSoundID _ambient;
    AVAudioPlayer *_backgroundMusicPlayer;
}

@property (strong,nonatomic) RootViewController *rootViewController;

@property BOOL panEnabled;

@property UIImageView *textView;


@property (strong, nonatomic) id dataObject;

/*
@property BOOL receiveTouch;

- (BOOL) getReceiveTouch;

*/
//-(void) loadLambsEar;

@end
