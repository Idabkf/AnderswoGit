//
//  StockItemView.m
//  Farbwelten
//
//  Created by Ida Buchwald on 14.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "StockItemView.h"

@implementation StockItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUserInteractionEnabled:YES];
        self.rotated = NO;
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer.delegate = self;
        [self addGestureRecognizer:panRecognizer];
        
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        pinchRecognizer.delegate = self;
        [self addGestureRecognizer:pinchRecognizer];
        
        UIRotationGestureRecognizer *rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
        rotateRecognizer.delegate = self;
        [self addGestureRecognizer:rotateRecognizer];
    }
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

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
    recognizer.view.center = [recognizer locationInView:self.superview];
}

-(void)handlePinch:(UIPinchGestureRecognizer *) recognizer{
    
    if (!self.rotated) {
        if (recognizer.state == UIGestureRecognizerStateBegan){
            self.oldRect = recognizer.view.frame;
            self.oldCenter = recognizer.view.center;
        }
        
        else{
            CGFloat scale = recognizer.scale;
            scale = MAX(scale, 0.7);
            scale = MIN(scale, 3.0);
            CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
                        recognizer.view.frame = CGRectApplyAffineTransform(self.oldRect, scaleTransform);
            recognizer.view.center = self.oldCenter;
        }
    }
    
    /*
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.scale = recognizer.scale;
        recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, self.scale, self.scale);
    }
    
    else {
        CGFloat scale = recognizer.scale - self.scale ;
        NSLog(@"SELF.SCALE: %f  RECOGNIZER:SCALE: %f  SCALE: %f", self.scale, recognizer.scale, scale);
        
        recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, scale, scale);
    }
    
    */
}


-(void)handleRotation:(UIRotationGestureRecognizer *) recognizer{
    self.rotated = YES;
    recognizer.view.transform = CGAffineTransformMakeRotation(recognizer.rotation);
    /*
    if (recognizer.state == UIGestureRecognizerStateBegan){
        self.oldRect = recognizer.view.frame;
        self.oldCenter = recognizer.view.center;
    }
    
    else{
        CGAffineTransform rotation = CGAffineTransformMakeRotation(recognizer.rotation);
        recognizer.view.frame = CGRectApplyAffineTransform(self.oldRect, rotation);
        //recognizer.view.center = self.oldCenter;
    }
     */
}

@end
