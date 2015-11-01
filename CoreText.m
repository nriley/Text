//
//  CoreText.m
//  Text
//
//  Created by Nicholas Riley on 5/11/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"
#import "CoreText.h"

#include <ApplicationServices/ApplicationServices.h>

@implementation CoreText

- (void)drawRect:(NSRect)rect {
    NSDrawWhiteBezel([self bounds], rect);

    CTFontRef font = CTFontCreateWithName((CFStringRef)[NSString stringWithUTF8String: PSFONT],
					  SIZE, NULL);
    if (((Controller *)[[self window] delegate]).coreTextUseFixedAdvanceAttribute) {
	CTFontDescriptorRef descriptor = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[NSDictionary dictionaryWithObject:[NSNumber numberWithInt: 7] forKey:(id)kCTFontFixedAdvanceAttribute]);
	CTFontRef newFont = CTFontCreateCopyWithAttributes(font, SIZE, NULL, descriptor);
	CFRelease(font);
	font = newFont;
    }
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    CFDictionaryRef attr = CFDictionaryCreate(NULL, (const void **)&keys, (const void **)&values,
					      sizeof(keys) / sizeof(keys[0]), NULL, NULL);
    CFAttributedStringRef attrString = CFAttributedStringCreate(NULL, CFSTR("sample"), attr);
    CFRelease(attr);
    
    CTLineRef line = CTLineCreateWithAttributedString(attrString);
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextSetTextPosition(context, 10, 20);
    CTLineDraw(line, context);
    CFRelease(line);
    
    CFRelease(attrString);
    CFRelease(font);
}

@end
