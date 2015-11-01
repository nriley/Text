//
//  main.m
//  Text
//
//  Created by Nicholas Riley on 5/11/08.
//  Copyright Nicholas Riley 2008. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    for (NSString *f in [[NSBundle mainBundle] pathsForResourcesOfType: @"ttf" inDirectory: nil]) {
	FSRef fsr;
	ATSFontContainerRef fontContainer;
	NSLog(@"activating %@", f);
	assert(CFURLGetFSRef((CFURLRef)[NSURL fileURLWithPath: f], &fsr));
	verify_noerr(ATSFontActivateFromFileReference(&fsr, kATSFontContextLocal, kATSFontFormatUnspecified, NULL, kATSOptionFlagsDefault, &fontContainer));
    }
    [pool release];

    return NSApplicationMain(argc, (const char **) argv);
}
