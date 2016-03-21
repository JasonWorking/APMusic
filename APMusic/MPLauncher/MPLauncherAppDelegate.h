//
//  MPLauncherAppDelegate.h
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPLauncherAppDelegate : NSObject <DTMicroApplicationDelegate>

- (UIViewController *)rootControllerInApplication:(DTMicroApplication *)application;

@end