//
//  MiniLogoController.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TNMiniLogoController.h"
#import "TNMiniLogoInterpreter.h"


@implementation TNMiniLogoController

-(id)init{

	if ((self = [super init])) {
		
		interpreter = [[TNMiniLogoInterpreter alloc]init];

	}
	
	return self;
}

-(void)awakeFromNib{
    
    [[inputScrollView documentView] insertText:@"Insert your MiniLogo code here"];
    [progressLabel setHidden:YES];
    
}

- (void)bgThread:(NSConnection *)connection{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    //[NSThread sleepForTimeInterval:5];
    
    NSString* input = [[inputScrollView documentView]string];
    NSString* output = [interpreter interpretMiniLogoString:input];
    
    [self performSelectorOnMainThread:@selector(bgThreadIsDone:) withObject:output waitUntilDone:NO];
    [pool release];
}

- (void)bgThreadIsDone:(NSString*)output{
    
    [[outputScrollView documentView]setString:output];
    [[[outputScrollView documentView] textStorage] setFont:[NSFont userFixedPitchFontOfSize:10]];
    [[splitView animator] setPosition:[splitView minPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];
    [progressIndicator stopAnimation:nil];
    [progressLabel setHidden:YES];
    
}


-(IBAction)clearInputTextView:(id)sender{

	[[inputScrollView documentView]setString:@""];
	[[outputScrollView documentView]setString:@""];
    
    [[splitView animator] setPosition:[splitView maxPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];
	
}

-(IBAction)drawOutputTextView:(id)sender{
    
    [progressIndicator startAnimation:sender];
    [progressLabel setHidden:NO];
    
    [NSThread detachNewThreadSelector:@selector(bgThread:) toTarget:self withObject:nil];
	 
}

-(void)dealloc{
	[interpreter release];
	[super dealloc];
}



@end
