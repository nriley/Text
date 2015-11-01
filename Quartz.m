//
//  Quartz.m
//  Text
//
//  Created by Nicholas Riley on 5/13/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"
#import "Quartz.h"

#import <ApplicationServices/ApplicationServices.h>

@implementation Quartz

- (void)drawRect:(NSRect)rect {
    NSDrawWhiteBezel([self bounds], rect);

    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSelectFont(context, PSFONT, SIZE, kCGEncodingFontSpecific);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextSetTextPosition(context, 10, 20);
    if (!strcmp(FONT, "Rosie"))
	CGContextShowText(context, "\x6b\x59\x65\x68\x64\x5d", 6);
    else
	CGContextShowText(context, "\x56\x44\x50\x53\x4f\x48", 6);
}

@end
