//
//  main.m
//  APMusic
//
//  Created by Jason on 3/21/16.
//  Copyright (c) 2016 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPAppInterfaceImp.h"

int main(int argc, char * argv[]) {
	enable_crash_reporter_service();
    @autoreleasepool {
        mPaasInit(@"APPKEY_IOS", [MPAppInterfaceImp class]);
        return UIApplicationMain(argc, argv, @"DFApplication", @"DFClientDelegate");
    }
}