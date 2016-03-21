//
//  MPSplashWindow.h
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPSplashWindow;

typedef void (^MPSplashDismissBlock)(MPSplashWindow* window);

@interface MPSplashWindow : UIWindow

@property (nonatomic, assign) BOOL bootFinished; // 启动完成才能消失，即使minTime已经到了

// minTime表示最短显示时间
+ (MPSplashWindow*)showSplashWindow:(NSTimeInterval)minTime dismissBlock:(MPSplashDismissBlock)dismissBlock;

@end
