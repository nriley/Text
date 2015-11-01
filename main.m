//
//  main.m
//  Text
//
//  Created by Nicholas Riley on 5/11/08.
//  Copyright Nicholas Riley 2008. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreText/CoreText.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    assert(CTFontManagerRegisterFontsForURLs((CFArrayRef)[[NSBundle mainBundle] URLsForResourcesWithExtension: @"ttf" subdirectory: nil], kCTFontManagerScopeProcess, NULL));
    [pool release];

    return NSApplicationMain(argc, (const char **) argv);
}
