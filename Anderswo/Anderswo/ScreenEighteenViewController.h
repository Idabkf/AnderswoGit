//
//  ScreenEighteenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenEighteenViewController : ScreenViewController{
    SystemSoundID _growl;
    SystemSoundID _gulp;
    SystemSoundID _belly;
    SystemSoundID _spit;
}

@property UIImageView *groelmView;
@property UIImageView *kindView;
@property int *imageFlg;

@end
