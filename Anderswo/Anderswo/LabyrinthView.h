//
//  LabyrinthView.h
//  Farbwelten
//
//  Created by Ida Buchwald on 03.07.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabyrinthView : UIView

@property CGImageRef imageRef;

@property UIImage *labyrinthImage;

- (UIColor *) colorOfPoint:(CGPoint)point;

@end
