//
//  EraserView.m
//  Farbwelten
//
//  Created by Ida Buchwald on 30.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "EraserView.h"

@implementation EraserView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //Load eraser
        self.eraser = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Screen21-Eraser2" ofType:@"png"]];
        self.erasing = NO;
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.sandImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Screen21-RAETSEL-3-vIda_Sand_k" ofType:@"png"]];
        
        /*GestureRecognizer Pan
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer.delegate = self;
        [self addGestureRecognizer:panRecognizer];
        */
        [self setNeedsDisplay];
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

-(void) drawRect:(CGRect) rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.erasing) {
        if(self.imageRef){
            CGContextTranslateCTM(context, 0, rect.size.height);
            CGContextScaleCTM(context, 1.0, -1.0);
            
            CGContextDrawImage(context, rect, self.imageRef);
            CGImageRelease(self.imageRef);
            
            CGContextTranslateCTM(context, 0, rect.size.height);
            CGContextScaleCTM(context, 1.0, -1.0);
        }
        [self.eraser drawAtPoint:self.location blendMode:kCGBlendModeDestinationOut alpha:1.0];
        //[self.eraser d];
        
    }
    
    else{
        
        CGContextTranslateCTM(context, 0, rect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextDrawImage(context, rect, self.sandImage.CGImage);
        CGContextTranslateCTM(context, 0, rect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        /*
        CGContextSetFillColorWithColor( context, [UIColor colorWithRed:0.0 green:0.5 blue:0.5 alpha:1.0].CGColor );
        CGContextFillRect( context, rect );
         */

    }
    
    self.imageRef = CGBitmapContextCreateImage(context);
}
/*
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.erasing = YES;
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%i", touches.count);
    if (touches.count == 1) {
        UITouch *touch = [touches anyObject];
        
        CGPoint point = [touch locationInView:self];
        CGFloat x = point.x - self.eraser.size.width/2;
        CGFloat y = point.y - self.eraser.size.height/2;
        //self.location = CGPointMake(x, y);
        self.location = point;
        [self setNeedsDisplay];
    }
}
-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
         self.erasing = YES;
    }
    
    self.location = [recognizer locationInView:self];
    [self setNeedsDisplay];
}
*/



@end
