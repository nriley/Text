//
//  Cocoa.m
//  Text
//
//  Created by Nicholas Riley on 5/13/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"
#import "Cocoa.h"


@implementation Cocoa

- (void)drawRect:(NSRect)rect {
    NSDrawWhiteBezel([self bounds], rect);
    
    NSAttributedString *s = [[NSAttributedString alloc] initWithString: @"sample" attributes:
			     [NSDictionary dictionaryWithObject: [NSFont fontWithName: [NSString stringWithUTF8String: PSFONT]
										 size: SIZE]
							 forKey: NSFontAttributeName]];
    [s drawAtPoint: NSMakePoint(10, 20)];
    [s release];
}

@end
