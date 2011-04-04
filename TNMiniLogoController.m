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
        
        //[[inputScrollView documentView] setString:@"DIR SE FWD 25 PEN_DOWN DIR S FWD 50 DIR E FWD 50 DIR N FWD 50 DIR W FWD 50 DIR NE FWD 25 DIR SE FWD 25 PEN_UP DIR W FWD 47 DIR S FWD 15 PEN_DOWN DIR S FWD 35 DIR E FWD 20 DIR N FWD 35 DIR W FWD 20"];
		
	}
	
	return self;
}

-(IBAction)clearInputTextView:(id)sender{

	[[inputScrollView documentView]setString:@""];
	[[outputScrollView documentView]setString:@""];
    
    [[splitView animator] setPosition:[splitView maxPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];
	
}

-(IBAction)drawOutputTextView:(id)sender{
	
        
    [progressIndicator startAnimation:sender];
    
	NSString* input = [[inputScrollView documentView]string];
	NSString* output = [interpreter interpretMiniLogoString:input];
	
    [[outputScrollView documentView]setString:output];
    
    [[splitView animator] setPosition:[splitView minPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];

    [progressIndicator stopAnimation:sender];
	 
}

-(void)dealloc{
	[interpreter release];
	[super dealloc];
}

@end
