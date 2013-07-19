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
#import "ScreenTwentysixViewController.h"

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
    
    self.maxVolume = 0.6;
    
    //EMERGENCY TAP
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleEmergencyTap:)];
    recognizer.delegate = self;
    [recognizer setNumberOfTouchesRequired:4];
    [self.view addGestureRecognizer:recognizer];
    
    self.currentScreen = [self.modelController newViewControllerAtIndex:11 storyboard:self.storyboard];
    [self addChildViewController:self.currentScreen];
    [self.view addSubview:self.currentScreen.view];
    //[self presentViewController:self.currentScreen animated:NO completion:nil];
    
    [self loadLambsEar];
    [self loadLeftLambsEar];
    [self initSounds];
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

-(void) initSounds{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Seite umblaettern" ofType:@"m4a"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_flip);
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"Buch zuklappen" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_close);
    
    /*
    soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
    */
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
    int nextData = [self.currentScreen.dataObject integerValue] +1;
    [self handleSoundOfScreen:nextData];

    if ([self.currentScreen isKindOfClass:[ScreenTwentysixViewController class]]) {
        AudioServicesPlaySystemSound(_close);
    }
    else AudioServicesPlaySystemSound(_flip);
    
    
    ScreenViewController *nextScreen = [_modelController viewControllerAfterViewController:self.currentScreen];
    
    [self addChildViewController:nextScreen];
    //[nextScreen.view setHidden:YES];
    [self.view addSubview:nextScreen.view];
    
    [self transitionFromViewController:self.currentScreen
                      toViewController:nextScreen
                              duration:3.0
                               options:UIViewAnimationOptionTransitionCurlDown
                            animations:^{}
                            completion:^(BOOL finished){
                                if (nextScreen.startsound) {
                                    AudioServicesPlaySystemSound(_start);
                                }
                            }];
    
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
    AudioServicesPlaySystemSound(_flip);
    ScreenViewController *backScreen = [_modelController viewControllerBeforeViewController:self.currentScreen];
    
    [self addChildViewController:backScreen];
    //[nextScreen.view setHidden:YES];
    [self.view addSubview:backScreen.view];
    
    
    
    [self transitionFromViewController:self.currentScreen
                      toViewController:backScreen
                              duration:3.0
                               options:UIViewAnimationOptionTransitionCurlUp
                            animations:^{}
                            completion:^(BOOL finished){
                                if (backScreen.startsound) {
                                    AudioServicesPlaySystemSound(_start);
                                }
                            }];
    
    [self.currentScreen removeFromParentViewController];
    [self.currentScreen.view removeFromSuperview];
    self.currentScreen = backScreen;
    
    [self setLeftLambsear];
    if (self.currentScreen.panEnabled) {
        [self setLambsear];
    }
}

-(void) handleSoundOfScreen:(int)screenData{
    switch (screenData) {
        case 1:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"StadtAmbient-neu" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            //AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_ambient);
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = 0.6;
            [_backgroundMusicPlayer play];
            break;
        }
            
        case 2:{
            [self fadeOutVolume];
            break;
        }
        case 3:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 4:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Wald Ambient_leiser" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            //AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_ambient);
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 6:{
            [self fadeOutVolume];
            break;
        }
        case 7:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 8:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"StadtAmbient-neu" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 9:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 10:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Wasser Ambient" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 12:{
            [self fadeOutVolume];
            break;
        }
        case 13:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 14:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"StadtAmbient-neu" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 15:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 16:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Grölm knurrt" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            
            
            soundPath = [[NSBundle mainBundle] pathForResource:@"Sandsturm" ofType:@"m4a"];
            soundUrl = [NSURL fileURLWithPath:soundPath];
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 18:{
            [self fadeOutVolume];
            break;
        }
        case 19:{
            [_backgroundMusicPlayer stop];
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Belohnung" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundUrl), &_start);
            break;
        }
        case 20:{
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"StadtAmbient-neu" ofType:@"m4a"];
            NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
            NSError *error;
            _backgroundMusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
            [_backgroundMusicPlayer setDelegate:self];
            [_backgroundMusicPlayer setNumberOfLoops:-1];
            [_backgroundMusicPlayer prepareToPlay];
            _backgroundMusicPlayer.volume = self.maxVolume;
            [_backgroundMusicPlayer play];
            break;
        }
        case 21:{
            [self fadeInVolume];
            break;
        }
        case 22:{
            [self fadeOutVolume];
            break;
        }
        default:
            break;
    }
}

-(void) fadeOutVolume{
    if (_backgroundMusicPlayer.volume>0.0) {
        _backgroundMusicPlayer.volume -= 0.01;
        [self performSelector:@selector(fadeOutVolume) withObject:nil afterDelay:0.3];
    }
    else{
        [_backgroundMusicPlayer stop];
    }
}

-(void) fadeInVolume{
    if (_backgroundMusicPlayer.volume<1.1) {
        _backgroundMusicPlayer.volume += 0.01;
        [self performSelector:@selector(fadeInVolume) withObject:nil afterDelay:0.1];
    }
}

@end
