//
//  ScreenSegue.m
//  Anderswo
//
//  Created by Ida Buchwald on 13.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import "ScreenSegue.h"

@implementation ScreenSegue

-(void) perform{
    
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.sourceViewController cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    */
    
    //[self.destinationViewController dismissViewControllerAnimated:NO completion:nil];
    [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:nil];
    
    
}

@end
