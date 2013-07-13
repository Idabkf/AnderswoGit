//
//  ScreenTwelveViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenTwelveViewController : ScreenViewController{
    SystemSoundID _growl;
    SystemSoundID _gulp;
    SystemSoundID _belly;
    SystemSoundID _spit;
}

@property UIImageView *groelmView;
@property UIImageView *kindView;
@property int *imageFlg;

@end
