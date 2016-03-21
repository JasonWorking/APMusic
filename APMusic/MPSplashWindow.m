//
//  MPSplashWindow.m
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import "MPSplashWindow.h"

@interface MPSplashWindow ()

@property (nonatomic, assign) BOOL canDismiss;
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, copy) MPSplashDismissBlock dismissBlock;

@end

@implementation MPSplashWindow

+ (MPSplashWindow*)showSplashWindow:(NSTimeInterval)minTime dismissBlock:(MPSplashDismissBlock)dismissBlock
{
    DTViewController* viewController = [[DTViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"Splash.jpg"];
    [viewController.view addSubview:imageView];
   
    MPSplashWindow* splashWindow = [[MPSplashWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if (minTime > 0)
        splashWindow.timer = [NSTimer scheduledTimerWithTimeInterval:minTime target:splashWindow selector:@selector(shouldDismiss) userInfo:nil repeats:NO];
    else
        splashWindow.canDismiss = YES;
    splashWindow.dismissBlock = dismissBlock;
    splashWindow.userInteractionEnabled = NO;
    splashWindow.windowLevel = UIWindowLevelStatusBar - 1;
    splashWindow.rootViewController = viewController;
    [splashWindow makeKeyAndVisible];
    return splashWindow;
}

- (void)shouldDismiss
{
    self.timer = nil;
    self.canDismiss = YES;
    if (self.bootFinished)
        _dismissBlock(self);
}

- (void)setBootFinished:(BOOL)bootFinished
{
    _bootFinished = bootFinished;
    if (self.canDismiss)
        _dismissBlock(self);
}

@end
