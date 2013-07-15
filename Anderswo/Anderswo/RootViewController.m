//
//  RootViewController.m
//  Anderswo
//
//  Created by Ida Buchwald on 14.07.13.
//  Copyright (c) 2013 Tidal. All rights reserved.
//

#import "RootViewController.h"
#import "ModelController.h"
#import "AppDelegate.h"

@interface RootViewController ()
@property (readonly, strong, nonatomic) ModelController *modelController;
@end

@implementation RootViewController

@synthesize modelController = _modelController;

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
    
    /*
    CGRect bounds = CGRectMake(0.0f, 0.0f, 1536.0f, 2048.0f);
    [self.view setBounds:bounds];
    */
    
    //EMERGENCY TAP
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleEmergencyTap:)];
    recognizer.delegate = self;
    [recognizer setNumberOfTouchesRequired:4];
    [self.view addGestureRecognizer:recognizer];
    
    self.currentScreen = [self.modelController newViewControllerAtIndex:0 storyboard:self.storyboard];
    [self addChildViewController:self.currentScreen];
    [self.view addSubview:self.currentScreen.view];
    //[self presentViewController:self.currentScreen animated:NO completion:nil];
    
    [self loadLambsEar];
    [self loadLeftLambsEar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ModelController *)modelController
{
    // Return the model controller object, creating it if necessary.
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
        _modelController.rootViewController = self;
    }
    return _modelController;
}

-(void) loadLambsEar{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Eselsohr" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.lambsear = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.lambsear.frame = rect;
    CGPoint point = CGPointMake(981.75f, 682.75f);
    [self.lambsear setCenter:point];
    [self.lambsear setUserInteractionEnabled:YES];
    
    [self setLambsear];
}

-(void)setLambsear{
    [self.view addSubview:self.lambsear];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleNextTap:)];
    tapRecognizer.delegate = self;
    [self.lambsear addGestureRecognizer:tapRecognizer];
}

-(void) loadLeftLambsEar{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Eselsohr_links" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.lambsearLeft = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width/2, image.size.height/2);
    self.lambsearLeft.frame = rect;
    CGPoint point = CGPointMake(21.25f, 725.0f);
    [self.lambsearLeft setCenter:point];
    [self.lambsearLeft setUserInteractionEnabled:YES];
    
}

-(void)setLeftLambsear{
    [self.view addSubview:self.lambsearLeft];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackTap:)];
    tapRecognizer.delegate = self;
    [self.lambsearLeft addGestureRecognizer:tapRecognizer];
}


-(void) enablePan{
    [self setLambsear];
}

-(void) handleEmergencyTap:(UILongPressGestureRecognizer *) recognizer{
    //[self.rootViewController enablePan];
    //self.panEnabled = YES;
    [self setLambsear];
}



-(void)handleNextTap:(UITapGestureRecognizer *) recognizer{
    [self.lambsear removeFromSuperview];
    
    ScreenViewController *nextScreen = [_modelController viewControllerAfterViewController:self.currentScreen];
    
    [self addChildViewController:nextScreen];
    //[nextScreen.view setHidden:YES];
    [self.view addSubview:nextScreen.view];
    
    
    
    [self transitionFromViewController:self.currentScreen
                      toViewController:nextScreen
                              duration:3.0
                               options:UIViewAnimationOptionTransitionCurlDown
                            animations:^{}
                            completion:nil];
    
    [self.currentScreen removeFromParentViewController];
    [self.currentScreen.view removeFromSuperview];
    self.currentScreen = nextScreen;
    
    [self setLeftLambsear];
    if (self.currentScreen.panEnabled) {
        [self setLambsear];
    }
}

-(void)handleBackTap:(UITapGestureRecognizer *) recognizer{
    [self.lambsearLeft removeFromSuperview];
    
    ScreenViewController *backScreen = [_modelController viewControllerBeforeViewController:self.currentScreen];
    
    [self addChildViewController:backScreen];
    //[nextScreen.view setHidden:YES];
    [self.view addSubview:backScreen.view];
    
    
    
    [self transitionFromViewController:self.currentScreen
                      toViewController:backScreen
                              duration:3.0
                               options:UIViewAnimationOptionTransitionCurlUp
                            animations:^{}
                            completion:nil];
    
    [self.currentScreen removeFromParentViewController];
    [self.currentScreen.view removeFromSuperview];
    self.currentScreen = backScreen;
    
    [self setLeftLambsear];
    if (self.currentScreen.panEnabled) {
        [self setLambsear];
    }
}

@end
