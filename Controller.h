//
//  Controller.h
//  Text
//
//  Created by Nicholas Riley on 5/13/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import <Cocoa/Cocoa.h>


extern const char *FONT;
extern const char *PSFONT;
extern int SIZE;

@interface Controller : NSWindowController {
    BOOL atsuiUseDeviceMetrics, coreTextUseFixedAdvanceAttribute;
}

@property BOOL atsuiUseDeviceMetrics, coreTextUseFixedAdvanceAttribute;

- (IBAction)fontChanged:(id)sender;
- (IBAction)refresh:(id)sender;

@end
