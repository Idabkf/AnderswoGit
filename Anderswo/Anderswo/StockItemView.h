//
//  StockItemView.h
//  Farbwelten
//
//  Created by Ida Buchwald on 14.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StockItemView : UIImageView


//@property UIImageView *superView;
@property CGFloat angle;
@property CGFloat scale;

@property BOOL rotated;

@property CGRect oldRect;
@property CGPoint oldCenter;

@property BOOL max;
@property BOOL min;

@property CGRect bucketRect;

@property BOOL visible;

@end
