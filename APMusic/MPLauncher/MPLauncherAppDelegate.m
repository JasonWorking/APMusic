//
//  MPLauncherAppDelegate.m
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import "MPLauncherAppDelegate.h"
#import "MPTabBarController.h"

@interface MPLauncherAppDelegate ()

@property (nonatomic, strong) UITabBarController* tabBarController;
@property (nonatomic, strong) UIViewController *rootController;

@end

@implementation MPLauncherAppDelegate

- (id)init
{
    self = [super init];
    if (self)
    {
        NSArray *baseImgs = [NSArray arrayWithObjects:
                             @"TabBar_HomeBar",
                             @"TabBar_Discovery",
                             @"TabBar_PublicService",
                             @"TabBar_Friends",nil];
        NSArray *selectImgs = [NSArray arrayWithObjects:
                               @"TabBar_HomeBar_Sel",
                               @"TabBar_Discovery_Sel",
                               @"TabBar_PublicService_Sel",
                               @"TabBar_Friends_Sel",nil];
        
        UIViewController* tab1ViewController = [[DTViewController alloc] init];
        // 这里添加一个按钮，演示进入TestApp
        tab1ViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"TestApp" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
        
        UIViewController* tab2ViewController = [[DTViewController alloc] init];
        UIViewController* tab3ViewController = [[DTViewController alloc] init];
        UIViewController* tab4ViewController = [[DTViewController alloc] init];
        
        NSArray *navArray = @[tab1ViewController, tab2ViewController, tab3ViewController, tab4ViewController];
        NSArray *titles = @[@"主页", @"发现", @"服务", @"设置"];
        for (int i = 0; i < [navArray count]; i ++)
        {
            UIImage *bImg = [UIImage imageNamed:baseImgs[i]];
            UIImage *selectImg = [UIImage imageNamed:selectImgs[i]];
            
            UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:bImg selectedImage:selectImg];
            item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.tag = i;
            [(UIViewController *)navArray[i] setTabBarItem:item];
            ((UIViewController *)navArray[i]).title = titles[i];
        }
        
        self.tabBarController = [[MPTabBarController alloc] init];
        self.tabBarController.viewControllers = navArray;
        self.tabBarController.selectedIndex = 0;
        [self.tabBarController.delegate tabBarController:self.tabBarController didSelectViewController:tab1ViewController];
        self.rootController = self.tabBarController;
    }
    return self;
}

- (void)btnClick
{
    [DTContextGet() startApplication:@"20000002" params:@{} animated:YES];
}

- (UIViewController *)rootControllerInApplication:(DTMicroApplication *)application
{
    return self.rootController;
}

- (void)application:(DTMicroApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

}

- (void)application:(DTMicroApplication *)application willResumeWithOptions:(NSDictionary *)launchOptions
{

}

@end
