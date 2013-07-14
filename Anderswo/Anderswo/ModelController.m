//
//  ModelController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ModelController.h"

#import "ScreenViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSMutableArray *pageData;
@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        
        self.numberOfScreens = 25;
        self.numberOfFinishedScreens = 25;
        
        // Create the data model.
        /*_pageData = [NSArray array];
        for (int i = 0; i<25; i++) {
            [_pageData arrayByAddingObject:[NSNumber numberWithInt:i]];
        }
        */
        _pageData = [[NSMutableArray alloc] initWithCapacity:self.numberOfScreens];
        for (int i = 0; i<self.numberOfScreens; i++) {
            [_pageData addObject:[NSNumber numberWithInt:i]];
        }
        
        self.screenViews = [[NSMutableDictionary alloc] init];
        
        [self newViewControllerAtIndex:0 storyboard:[UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:[NSBundle mainBundle]]];
    }
    return self;
}

- (ScreenViewController *)newViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
   // NSLog(@"INDEX: %i", index);
    /*
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    */
    // Create a new screen view controller and pass suitable data.
    
    NSString *identifier = @"0";
    
    if (index<=self.numberOfFinishedScreens) {
        identifier = [NSString stringWithFormat:@"%i", index];
    }
    
    /*The 10th screen is the same as the 17th and the 24th. In each case -1 because screen 5 is missing and -1 because starting with 0*/
    //-1 because screen 11 was removed
    if (index == 14) {
        //NSLog(@"SCREEN 17");
        /*
        if ([self.screenViews objectForKey:@"14"]!=nil) {
            return [self.screenViews objectForKey:@"14"];
        }
        ScreenViewController *screenViewController = [self.screenViews objectForKey:@"8"];
        
        if (!screenViewController) {
            screenViewController = [storyboard instantiateViewControllerWithIdentifier:@"8"];
            [self.screenViews setValue:screenViewController forKey:@"8"];
        }
        
        screenViewController.dataObject = self.pageData[index];
        [self.screenViews setValue:screenViewController forKey:@"14"];
        return screenViewController;
         */
        
        identifier = @"8";
        
    }
    
    //-1 because screen 11 was removed
    //-1 because screen 20 was removed
    if (index == 20) {
        /*
        if ([self.screenViews objectForKey:@"20"]!=nil) {
            return [self.screenViews objectForKey:@"20"];
        }
        ScreenViewController *screenViewController = [self.screenViews objectForKey:@"14"];
        screenViewController.dataObject = self.pageData[index];
        [self.screenViews setValue:screenViewController forKey:@"20"];
        return screenViewController;
         */
        identifier = @"8";
    }
    
    ScreenViewController *screenViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    screenViewController.dataObject = self.pageData[index];
    [self.screenViews setValue:screenViewController forKey:[NSString stringWithFormat:@"%i",index]];
    return screenViewController;
}

- (ScreenViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard{
    
    if (index>self.numberOfFinishedScreens) {
        return [self.screenViews objectForKey:@"0"];
    }
    
    if (self.screenViews.count>index) {
        return [self.screenViews objectForKey:[NSString stringWithFormat:@"%i",index]];
    }
    else return [self newViewControllerAtIndex:index storyboard:storyboard];
}

- (NSUInteger)indexOfViewController:(ScreenViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source


- (UIViewController *)viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ScreenViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}


- (UIViewController *)viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ScreenViewController *)viewController];
    
   // NSLog(@"INDEX: %i", index);
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == self.numberOfFinishedScreens) {
        index--;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}




@end
