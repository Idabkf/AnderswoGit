//
//  EraserView.h
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EraserView : UIView

@property UIImage *eraser;
@property BOOL erasing;
@property CGPoint location;
@property CGImageRef imageRef;

@property UIImage *sandImage;

@end
