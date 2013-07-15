//
//  ModelController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScreenViewController;
@class RootViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

@property int numberOfScreens;
@property int numberOfFinishedScreens;

@property (strong,nonatomic) RootViewController *rootViewController;

@property NSMutableDictionary *screenViews;

- (ScreenViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (ScreenViewController *)newViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (ScreenViewController *)viewControllerAfterViewController:(UIViewController *)viewController;
- (ScreenViewController *)viewControllerBeforeViewController:(UIViewController *)viewController;

@end
