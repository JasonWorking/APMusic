//
//  MPTabBarController.m
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import "MPTabBarController.h"

@interface MPTabBarController ()

@end

@implementation MPTabBarController

- (void)loadView
{
    [super loadView];
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    self.title = viewController.title;
    if (self.title == nil)
        self.title = viewController.navigationItem.title;
    self.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem;
    self.navigationItem.leftBarButtonItems = viewController.navigationItem.leftBarButtonItems;
    self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItems = viewController.navigationItem.rightBarButtonItems;
}

@end
