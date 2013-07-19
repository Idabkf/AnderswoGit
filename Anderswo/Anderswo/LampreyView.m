//
//  LampreyView.m
//  Anderswo
//
//  Created by Ida Buchwald on 19.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import "LampreyView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LampreyView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.lampreyImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Screen14-Neunauge-vIda" ofType:@"png"]];
        [self setNeedsDisplay];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, self.lampreyImage.CGImage);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //self.imageRef = CGBitmapContextCreateImage(context);
}

/*FROM A TUTORIAL*/
- (UIColor *) colorOfPoint:(CGPoint)point
{
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    [self.layer renderInContext:context];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIColor *color = [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
    
    return color;
}
/*FROM A TUTORIAL END*/

@end
