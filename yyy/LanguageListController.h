//
//  LanguageListController.h
//  Presidents
//
//  Created by Dave Mark on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class yyyViewController;

@interface LanguageListController : UITableViewController {
	yyyViewController *detailViewController;
	NSArray *languageNames;
	NSArray *languageCodes;
}

@property (nonatomic, assign) yyyViewController *detailViewController;
@property (nonatomic, retain) NSArray *languageNames;
@property (nonatomic, retain) NSArray *languageCodes;

@end
