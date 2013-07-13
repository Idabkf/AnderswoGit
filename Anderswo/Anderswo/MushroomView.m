//
//  MushroomView.m
//  Farbwelten
//
//  Created by Ida Buchwald on 08.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "MushroomView.h"

@implementation MushroomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithImage:(UIImage *)image andTarget:(CGPoint) target{
    self = [super initWithImage:image];
    /*
    if (target.x>1024) {
        target.x -=1024;
    }
    */
    self.targetPoint = target;
    self.targetRect = CGRectMake(self.targetPoint.x, self.targetPoint.y, 1.0f, 1.0f);
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
