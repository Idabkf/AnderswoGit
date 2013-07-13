//
//  ScreenTwoViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"


@interface ScreenTwoViewController : ScreenViewController

@property UIView *rotationView;
@property UIImageView *cityView;

- (void)handleTap:(UITapGestureRecognizer *)recognizer;

@end
