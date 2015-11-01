//
//  Controller.m
//  Text
//
//  Created by Nicholas Riley on 5/13/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"


const char *FONT = "Screen";
const char *PSFONT = "ScreenMedium";
int SIZE = 11;

@implementation Controller

- (IBAction)fontChanged:(id)sender;
{
    FONT = strdup([[sender title] UTF8String]); // leaks
    if (!strcmp(FONT, "Screen")) {
	PSFONT = "ScreenBold";
	SIZE = 11;
    } else {
	PSFONT = FONT;
	SIZE = 13;
    }
    [self refresh: nil];
}

- (IBAction)refresh:(id)sender;
{
    [[[self window] contentView] setNeedsDisplay: YES];
}

@synthesize atsuiUseDeviceMetrics, coreTextUseFixedAdvanceAttribute, nsLayoutManagerUsesScreenFonts;

@end
