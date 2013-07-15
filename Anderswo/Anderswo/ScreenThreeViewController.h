//
//  ScreenThreeViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenThreeViewController : ScreenViewController{
    SystemSoundID _box;
    SystemSoundID _groelm;
    SystemSoundID _growl;
}

@property CGRect checkRect;

@property(strong, nonatomic) UIImageView *boxViewOne;
@property(strong, nonatomic) UIImageView *boxViewTwo;
@property(strong, nonatomic) UIImageView *boxViewThree;
@property(strong, nonatomic) UIImageView *boxViewFour;
@property(strong, nonatomic) UIImageView *boxViewFive;

@property NSMutableArray *boxViews;

@end
