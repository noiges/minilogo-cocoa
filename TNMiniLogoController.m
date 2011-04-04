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

	if (self = [super init]) {
		
		interpreter = [[TNMiniLogoInterpreter alloc]init];
		
		NSFont* font = [NSFont userFixedPitchFontOfSize:[NSFont systemFontSize]];
		[[outputScrollView documentView ] setFont:font];
		[[outputScrollView documentView] setString:@"Hello"];
		[[[outputScrollView documentView] textStorage] setFont:font];
		
	}
	
	return self;
}

-(IBAction)clearInputTextView:(id)sender{

	[[inputScrollView documentView]setString:@""];
	[[outputScrollView documentView]setString:@""];
	
}

-(IBAction)drawOutputTextView:(id)sender{
	
	NSString* input = [[inputScrollView documentView]string];
	NSString* output = [interpreter interpretMiniLogoString:input];
	[[outputScrollView documentView]setString:output];
	[[inputScrollView animator ]setFrameSize:NSMakeSize([inputScrollView frame].size.width, 0)];

	 
}

-(void)dealloc{
	[interpreter release];
	[super dealloc];
}

@end
