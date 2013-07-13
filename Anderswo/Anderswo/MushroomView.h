//
//  MushroomView.h
//  Farbwelten
//
//  Created by Ida Buchwald on 08.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MushroomView : UIImageView

@property CGPoint targetPoint;
@property CGRect targetRect;

-(id) initWithImage:(UIImage *)image andTarget:(CGPoint) target;

@end
