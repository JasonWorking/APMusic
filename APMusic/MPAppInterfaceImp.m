//
//  MPAppInterfaceImp.m
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import "MPAppInterfaceImp.h"
#import "MPSplashWindow.h"

@interface MPAppInterfaceImp ()

@property (nonatomic, strong) MPSplashWindow* splashWindow;

@end

@implementation MPAppInterfaceImp

- (id)init
{
    if (self = [super init])
    {
    }
    return self;
}

- (BOOL)appUseSettingService
{
    return YES;
}

- (id)appDelegateEvent:(mPaasAppEventType)event arguments:(NSDictionary*)arguments
{
    if (event == mPaasAppEventBeforeStartLoader)
    {
        // 显示闪屏
        __weak MPAppInterfaceImp* weakSelf = self;
        _splashWindow = [MPSplashWindow showSplashWindow:2.0f dismissBlock:^(MPSplashWindow *window) {
            [DTContextGet().window makeKeyAndVisible];
            [UIView animateWithDuration:0.6 animations:^{
                UIView* view = window.rootViewController.view;
                view.alpha = 0.0f;
                view.transform = CGAffineTransformMakeScale(1.5, 1.5);
            } completion:^(BOOL finished) {
                weakSelf.splashWindow = nil;
            }];
        }];
    }
    else if (event == mPaasAppEventAfterDidFinishLaunching)
    {
        if (_splashWindow)
            _splashWindow.bootFinished = YES;
    }
    
    NSLog(@"%d, %@", (int)event, arguments);
    return nil;
}

@end