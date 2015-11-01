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

    NSDictionary *attributes = [NSDictionary dictionaryWithObject: [NSFont fontWithName: [NSString stringWithUTF8String: PSFONT] size: SIZE] forKey: NSFontAttributeName];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString: @"sample" attributes: attributes];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    [layoutManager setUsesScreenFonts: ((Controller *)[[self window] delegate]).nsLayoutManagerUsesScreenFonts];
    [layoutManager addTextContainer: textContainer];
    [textContainer release];
    [textStorage addLayoutManager: layoutManager];
    [layoutManager release];

    NSRange glyphRange = [layoutManager glyphRangeForTextContainer: textContainer];
    [self lockFocus];
    [layoutManager drawGlyphsForGlyphRange: glyphRange atPoint: NSMakePoint(5, 15)];
    [self unlockFocus];

    [textStorage release];
}

@end
