//
//  myProtocolAppDelegate.m
//  myProtocol
//
//  Created by Amos Bannister on 19/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "myProtocolAppDelegate.h"

@implementation myProtocolAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    view = [[myView alloc] 
            initWithFrame:[[UIScreen mainScreen] bounds]];
    [view setDelegate:self];
    [window addSubview:view];
    
    UIButton *animateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [animateButton setTitle:@"Animacja" forState:UIControlStateNormal];
    [animateButton addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    [animateButton setFrame:CGRectMake(25, 380, 270, 30)];
    [window addSubview:animateButton];
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)animate {
    [view animate];
}

- (void)animationStartedWithView:(UIView *)animatedView {
    NSLog(@"The animation has started");
    [animatedView setBackgroundColor:[UIColor whiteColor]];
}

- (void)animationHasFinishedWithView:(UIView *)animatedView {
    NSLog(@"The animation has finished");
    [animatedView setBackgroundColor:[UIColor blackColor]];
}

@end
