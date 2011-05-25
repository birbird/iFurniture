//
//  ScrollViewViewController.m
//  ScrollView
//
//  Created by dan on 11-5-7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewViewController.h"

@implementation ScrollViewViewController

@synthesize scrollView1;
@synthesize currentItem;

const CGFloat kScrollObjHeight	= 1000;
const CGFloat kScrollObjWidth	= 768;
const NSUInteger kNumImages		= 5;

-(IBAction)returnhome:(id)sender{
	NSLog(@"home");
	[self.view removeFromSuperview];
}

- (void)layoutScrollImages
{
    printf("layoutScrollImages \n");
    
	UIImageView *view = nil;
	NSArray *subviews = [scrollView1 subviews];
    
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView1 setContentSize:CGSizeMake((itemCount * kScrollObjWidth), [scrollView1 bounds].size.height)];
}

- (void)dealloc
{
    [scrollView1 release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidLoad
{
    printf("viewDidLoad \n");
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    
	// 1. setup the scrollview for multiple images and add it to the view controller
	//
	// note: the following can be done in Interface Builder, but we show this in code for clarity
	[scrollView1 setBackgroundColor:[UIColor blackColor]];
	[scrollView1 setCanCancelContentTouches:NO];
	scrollView1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView1.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView1.scrollEnabled = YES;
	
	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
	// if you want free-flowing scroll, don't set this property.
	scrollView1.pagingEnabled = YES;
	
	// load all the images from our bundle and add them to the scroll view
    
    NSArray * paths = [NSBundle pathsForResourcesOfType: @"jpg" inDirectory: [[NSBundle mainBundle] bundlePath]];
    NSMutableArray * allImageNames = [[NSMutableArray alloc] init];
    
    NSUInteger i = 0;
    for ( NSString * path in paths )
    {
        //NSLog(path);
        if ( [[path lastPathComponent] hasPrefix: currentItem] ) {
            NSLog(path);
                     
            NSString *imageName = [path lastPathComponent];
            UIImage *image = [UIImage imageNamed:imageName];
            //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
            imageView.image = image;
            
            // setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
            //CGRect rect = imageView.frame;
            //rect.size.height = kScrollObjHeight;
            //rect.size.width = kScrollObjWidth;
            //imageView.frame = rect;
            imageView.tag = i;	// tag our images for later use when we place them in serial fashion
            [scrollView1 addSubview:imageView];
            [imageView release];
            i++;
        }        
    }
    itemCount = i - 1;

	
	[self layoutScrollImages];	// now place the photos in serial layout within the scrollview
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
