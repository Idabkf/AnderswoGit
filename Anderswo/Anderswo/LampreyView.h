//
//  LampreyView.h
//  Anderswo
//
//  Created by Ida Buchwald on 19.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LampreyView : UIView

@property CGImageRef imageRef;

@property UIImage *lampreyImage;

- (UIColor *) colorOfPoint:(CGPoint)point;

@end
