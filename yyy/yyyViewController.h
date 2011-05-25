//
//  yyyViewController.h
//  yyy
//
//  Created by dan on 11-5-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridView.h"
#import "ImageDemoCellChooser.h"
#import "ScrollViewViewController.h"


@interface yyyViewController : UIViewController<AQGridViewDelegate, AQGridViewDataSource, ImageDemoCellChooserDelegate, UIPopoverControllerDelegate> 
{
    NSArray * _orderedImageNames;
    NSArray * _imageNames;
    AQGridView * _gridView;
    
    NSUInteger _cellType;
    UIPopoverController * _menuPopoverController;
    
    UIPopoverController *popoverController;
    UIToolbar *toolbar;
    
    id detailItem;
    UILabel *detailDescriptionLabel;
    UIWebView *webView;
	UIBarButtonItem *languageButton;
    UIPopoverController *languagePopoverController;
    NSString *languageString;	
    
    ScrollViewViewController *scrollView;
    
}

@property (nonatomic, retain) IBOutlet AQGridView * gridView;

- (IBAction) shuffle;
- (IBAction) resetOrder;
- (IBAction) displayCellTypeMenu: (UIBarButtonItem *) sender;
- (IBAction) toggleLayoutDirection: (UIBarButtonItem *) sender;

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *languageButton;
@property (nonatomic, retain) UIPopoverController *languagePopoverController;
@property (nonatomic, copy) NSString *languageString;
- (IBAction)touchLanguageButton;

@end
