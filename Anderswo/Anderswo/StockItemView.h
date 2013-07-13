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

@end
