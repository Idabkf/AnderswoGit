//
//  ScreenFourViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenFourViewController : ScreenViewController{
    SystemSoundID _growl;
    SystemSoundID _gulp;
    SystemSoundID _belly;
    SystemSoundID _spit;
}

@property UIImageView *groelmView;
@property UIImageView *kindView;
@property int *imageFlg;

@end