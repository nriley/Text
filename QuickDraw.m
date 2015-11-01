//
//  QuickDraw.m
//  Text
//
//  Created by Nicholas Riley on 5/11/08.
//  Copyright 2008 Nicholas Riley. All rights reserved.
//

#import "Controller.h"
#import "QuickDraw.h"
#include <Carbon/Carbon.h>

@implementation QuickDraw

- (void)drawRect:(NSRect)rect {
    NSDrawWhiteBezel([self bounds], rect);
    
    CGrafPtr port = [self qdPort];
    short family;
    Str255 font;
    c2pstrcpy(font, FONT);
    GetFNum(font, &family);
    SetPortTextFont(port, family);
    SetPortTextSize(port, SIZE);
    MoveTo(10, 15);
    DrawText("sample", 0, 6);
}

@end
