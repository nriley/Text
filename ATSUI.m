//
//  ATSUI.m
//  Text
//
//  Created by Nicholas Riley on 5/11/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"
#import "ATSUI.h"
#include <Carbon/Carbon.h>

@implementation ATSUI

- (void)drawRect:(NSRect)rect {
    NSDrawWhiteBezel([self bounds], rect);
    
    ATSUFontID font = 0;
    // if we match the family with FONT instead, I get the bold version
    verify_noerr(ATSUFindFontFromName(PSFONT, strlen(PSFONT), kFontPostscriptName, kFontNoPlatformCode, kFontNoScriptCode, kFontNoLanguageCode, &font));
    
    Fixed size = FloatToFixed(SIZE);

    ATSUStyle style;
    ATSUCreateStyle(&style);
    {
	ATSUAttributeTag tags[] = { kATSUFontTag, kATSUSizeTag };
	ByteCount sizes[] = { sizeof(ATSUFontID), sizeof(Fixed) };
	ATSUAttributeValuePtr values[] = { &font, &size };
	verify_noerr(ATSUSetAttributes(style, 2, tags, sizes, values));
    }
    
    ATSUTextLayout layout;
    UniChar sample[] = { 's', 'a', 'm', 'p', 'l', 'e' };
    UniCharCount length = sizeof(sample)/sizeof(UniChar);
    verify_noerr(ATSUCreateTextLayoutWithTextPtr(sample, kATSUFromTextBeginning, kATSUToTextEnd,
						 length, 1, &length, &style, &layout));
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    ATSLineLayoutOptions options = ((Controller *)[[self window] delegate]).atsuiUseDeviceMetrics ? kATSLineUseDeviceMetrics : kATSLineNoLayoutOptions;
    {
	ATSUAttributeTag tags[] = { kATSUCGContextTag, kATSULineLayoutOptionsTag };
	ByteCount sizes[] = { sizeof(CGContextRef), sizeof(ATSLineLayoutOptions) };
	ATSUAttributeValuePtr values[] = { &context, &options };
	verify_noerr(ATSUSetLayoutControls(layout, 2, tags, sizes, values));
    }
    
    verify_noerr(ATSUDrawText(layout, kATSUFromTextBeginning, kATSUToTextEnd, Long2Fix(10), Long2Fix(20)));

    ATSUDisposeStyle(style);
    ATSUDisposeTextLayout(layout);
}

@end
