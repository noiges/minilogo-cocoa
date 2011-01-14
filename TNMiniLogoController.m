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
	}
	
	return self;
}

-(IBAction)clearInputTextView:(id)sender{

	[[inputTextView documentView]setString:@""];
	[[outputTextView documentView]setString:@""];
	
}

-(IBAction)drawOutputTextView:(id)sender{
	
	NSString* input = [[inputTextView documentView]string];
	NSString* output = [interpreter interpretMiniLogoString:input];
	[[outputTextView documentView]setString:output];
	 
}

-(void)dealloc{
	[interpreter release];
	[super dealloc];
}

@end
