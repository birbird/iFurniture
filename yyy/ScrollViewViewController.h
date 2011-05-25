//
//  ScrollViewViewController.h
//  ScrollView
//
//  Created by dan on 11-5-7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewViewController : UIViewController {
    IBOutlet UIScrollView *scrollView1;	// holds five small images to scroll horizontally
    NSString *currentItem;
    NSInteger itemCount;
}

@property (nonatomic, retain) UIView *scrollView1;
@property (nonatomic, copy) NSString * currentItem;

-(IBAction)returnhome:(id)sender;

@end
