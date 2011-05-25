//
//  yyyAppDelegate.h
//  yyy
//
//  Created by dan on 11-5-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class yyyViewController;

@interface yyyAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet yyyViewController *viewController;

@end
