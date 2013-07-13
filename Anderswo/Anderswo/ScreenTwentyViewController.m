//
//  ScreenTwentyViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentyViewController.h"
//#import "RootViewController.h"

@interface ScreenTwentyViewController ()

@end

@implementation ScreenTwentyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen19-Sandkind" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.kindView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(216.0f, 227.5f, image.size.width/2, image.size.height/2);
    self.kindView.frame = rect;
    [self.kindView setUserInteractionEnabled:YES];
    [self.view addSubview:self.kindView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen19-Sandsturm" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.sturmView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.sturmView.frame = rect;
    [self.sturmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.sturmView];
    
    [self animateStorm];
    
    //enable pageViews recognizer
    //[self.rootViewController enablePan];
    self.panEnabled = YES;
}

/*Umblättern immer möglich
 -(void) viewDidAppear:(BOOL)animated{
 [super viewDidAppear:animated];
 
 if (self.panEnabled) {
 //disable pageViews recognizer
 [self.rootViewController disablePan];
 self.panEnabled = NO;
 }
 }
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animateStorm{
    self.sturmView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 4.0f, 0.0f);
    [UIImageView animateWithDuration:1.0
                               delay:0.0
                             options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                          animations:^{
                              [UIView setAnimationRepeatCount:3];
                              self.sturmView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -4.0f, 0.0f);
                          }completion:^(BOOL finished){
                              self.sturmView.transform = CGAffineTransformIdentity;
                          }];
}

@end
