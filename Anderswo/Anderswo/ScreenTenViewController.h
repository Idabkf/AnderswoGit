//
//  ScreenTenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"
#import "StockItemView.h"

@interface ScreenTenViewController : ScreenViewController{
    SystemSoundID _mushroom;
    SystemSoundID _eye;
    SystemSoundID _bottle;
}

@property CGRect frameRect;

@property CGFloat zoomScale;

@property BOOL itemSet;
@property NSMutableArray *items;



/*
@property UIImage *mushroom1;
@property UIImage *mushroom2;
@property UIImage *mushroom3;
*/


@property UIImageView *stockView;
@property UIImageView *bucketView;
@property StockItemView *stockItemView;

@property UIImageView *mushroom1View;
@property UIImageView *mushroom2View;
@property UIImageView *mushroom3View;


@property UIImageView *eye1View;
@property UIImageView *eye2View;
@property UIImageView *eye3View;

@property UIImageView *bottle1View;
@property UIImageView *bottle2View;
@property UIImageView *bottle3View;


-(void) setItemsOfOldScreen;
-(void) removeItem:(StockItemView*)item;

@end
